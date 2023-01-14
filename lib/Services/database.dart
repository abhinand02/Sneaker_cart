import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Services/auth.dart';

import '../Constants/firebase_constants.dart';
import '../Widgets/bottom_nav_bar.dart';

class DatabaseServic {
  final AuthService _auth = AuthService();
  late User? currentUser = _auth.auth.currentUser;
  late CollectionReference usersCollection =
      _auth.firestore.collection(userscollection);
  late CollectionReference productCollection =
      _auth.firestore.collection(productscollection);
  late CollectionReference cartCollection =
      _auth.firestore.collection(cartcollection);
  late CollectionReference addressCollection =
      _auth.firestore.collection(userAdressCollection);
  late CollectionReference orderCollection =
      _auth.firestore.collection(ordercollection);
  late CollectionReference favCollection =
      _auth.firestore.collection(favoritecollection);

  Future<QuerySnapshot<Object?>> getData() async {
    QuerySnapshot querySnapshot = await productCollection.get();
    // final allData =   querySnapshot.docs;
    // print((querySnapshot.docs[0].data() as Map<String, dynamic>)['name']);
    return querySnapshot;
  }

  Future<QuerySnapshot<Object?>> getNewArrival(
      {required String field,
      required dynamic condition,
      required CollectionReference<Object?> collectionObject}) async {
        late QuerySnapshot querySnapshot;
    try {
        querySnapshot =  await collectionObject.where(field, isEqualTo: condition).get();
        return querySnapshot;
    // print((querySnapshot.docs[0].data() as Map<String, dynamic>)['name']);
    }  catch  (e) {
      print(e);
      //  Center(child: Text('no internet'),);
    }
    return querySnapshot;
  }

  Future<DocumentSnapshot<Object?>> getProduct(String docName) async {
    final querySnapshot = await productCollection.doc(docName).get();
    // print(querySnapshot.data());
    return querySnapshot;
  }

  Future<UserCredential?> loginMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await _auth.auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(),
            ),
            (route) => false);
        return userCredential;
      });
    } on FirebaseAuthException catch (e) {
      // print('qwer $e');
      final snackbar = SnackBar(content: Text(e.toString()));

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    return userCredential;
  }

  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await _auth.auth
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return userCredential;
  }

  storeUserData({name, password, email}) async {
    DocumentReference store = usersCollection.doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
    });
  }

  updateUSerData({required String name, required String password}) async{
     usersCollection.doc(currentUser!.uid).update({
      'name': name,
      'password': password,
     });
  }

  Future addToCart(
      {required String productName,
      required image,
      required size,
      required quantity,
      required totalPrice}) async {
    final data = await getNewArrival(
        field: 'user_id',
        condition: currentUser!.uid,
        collectionObject: cartCollection);
    final result = data.docs;
    final index = result.indexWhere((element) =>
        element['product_name'] == productName && element['size'] == size);

    if (index.isNegative) {
      await cartCollection.doc().set({
        'user_id': currentUser!.uid,
        'product_name': productName,
        'image': image,
        'size': size,
        'quantity': quantity,
        'total_price': totalPrice,
      });
    } else {
      final docId = result[index].id;
      await cartCollection.doc(docId).update({
        'quantity': (int.parse(quantity) + 1).toString(),
      });
    }
  }

  Future updateQuantity(
      {required String productName, required size, required quantity}) async {
    final data = await getNewArrival(
        field: 'user_id',
        condition: currentUser!.uid,
        collectionObject: cartCollection);
    final result = data.docs;
    final index = result.indexWhere((element) =>
        element['product_name'] == productName && element['size'] == size);

    if (int.parse(quantity) < 2) {
      await cartCollection.doc(result[index].id).delete();
    } else {
      final docId = result[index].id;
      await cartCollection.doc(docId).update(
        {
          'quantity': (int.parse(quantity) - 1).toString(),
        },
      );
    }
  }

  addAddress(
      {required String name,
      required address,
      required state,
      required pincode,
      required phnnumber,
      required BuildContext context}) async {
    try {
      await addressCollection.doc().set({
        'user_id': currentUser!.uid,
        'name': name,
        'state': state,
        'address': address,
        'number': phnnumber,
        'pincode': pincode,
      }).then((value) {
        const snackbar = SnackBar(content: Text('Address Added Sucessfully'));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      });
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

 Future updateAddress({required String number, required condition})async{
   final data =  await addressCollection.where('address',isEqualTo: condition,).get();
   final docId =  data.docs[0].id;
    addressCollection.doc(docId).update({
      "number" : number
    });
   print(data.docs[0].id);
  }

  Future addOrderDetails({required String address}) async {
    final result = await DatabaseServic().getNewArrival(
        field: 'user_id',
        condition: currentUser!.uid,
        collectionObject: DatabaseServic().cartCollection);
    for (var i = 0; i < result.docs.length; i++) {
      final data = result.docs[i].data() as Map<String, dynamic>;
      final prodctName = data['product_name'];
      final quantity = data['quantity'];
      final total = data['total_price'];
      final image = data['image'];
      await orderCollection.doc().set({
        "user_id": currentUser!.uid,
        "product_name": prodctName,
        "quantity": quantity,
        "total": (int.parse(total) * int.parse(quantity) + 40).toString(),
        "image": image,
        "date": DateTime.now(),
        "address": address,
        "order_status": 'Confirmed',
      });
    }
    for (var i = 0; i < result.docs.length; i++) {
      await cartCollection.doc(result.docs[i].id).delete();
    }
  }

  getOrders() async {
    final data = await orderCollection
        .orderBy(
          'date',
          descending: true,
        )
        .where('user_id', isEqualTo: currentUser!.uid)
        .get();

    //  print((data.docs[0].data() as Map<String, dynamic>)['product_name']);
    return data;
  }

  Future addToFav(
      {required String prodctName,
      required img,
      required price,
      required BuildContext context,
      required String category}) async {
    final data = favCollection.where('user_id', isEqualTo: currentUser!.uid);
    final result =
        await data.where('product_name', isEqualTo: prodctName).get();
    // print((result.docs.isEmpty));
    // print((result.docs[0].data() as Map<String, dynamic>) ['product_name']);
    if (result.docs.isEmpty) {
      favCollection.doc().set(
        {
          "user_id": currentUser!.uid,
          "product_name": prodctName,
          "price": price,
          "image": img,
          "category": category,
        },
      ).then((value) {
        SnackBar snackBar = SnackBar(
          content: Text(
            'Product Added to Favorites',
            style: smallText,
          ),
          backgroundColor: mainColor,
          shape: const StadiumBorder(),
          margin: const EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar,
        );
      });
    } else {
      favCollection.doc(result.docs[0].id).delete().then((value) {
        SnackBar snackBar = SnackBar(
          content: Text(
            'Product Removed from Favorites',
            style: smallText,
          ),
          backgroundColor: mainColor,
          shape: const StadiumBorder(),
          margin: const EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  Future<bool> getFavData({required String prodctName}) async {
    final data = favCollection.where('user_id', isEqualTo: currentUser!.uid);
    final result =
        await data.where('product_name', isEqualTo: prodctName).get();
    // print(result.docs.isEmpty);
    return result.docs.isEmpty;
  }

  // Future<File> getImage() async {
  //   ImagePicker _picker = ImagePicker();

  //   XFile? image = await _picker.pickImage(source: ImageSource.gallery, maxHeight: 100, maxWidth: 100);
  //   final imagee = File(image!.path);
  //    cropImage(image);
  //   return imagee;
  // }

  // cropImage(filepath) async {
  //   CroppedFile? croppedImage = await ImageCropper.platform.cropImage(sourcePath: filepath,aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           toolbarColor: Colors.deepOrange,
  //           toolbarWidgetColor: Colors.white,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false)],);
  // }
//  String imageUrl = '';
  // updateProfileImage({required File profileImage}) async{
  //   Reference ref = _auth.firebaseStorage.ref().child('Users Profile Image').child(currentUser!.uid).child('userimage');
  //   UploadTask uploadTask = ref.putFile(profileImage);
  //   await uploadTask.whenComplete(() async{
  //   var url = await ref.getDownloadURL();
  //   imageUrl= url.toString();
  //   }).catchError((error){
  //      print(error);
  //   });
  //   await usersCollection.doc(currentUser!.uid).update({
  //      "image": imageUrl,
  //   });
  //  return imageUrl;
  // }

  searchResult({required String searchKey}) async {
    final data = await productCollection
        .orderBy('product_name')
        .startAt([searchKey]).get();
    final ds = (data.docs[0].data() as Map<String, dynamic>)['product_name'];
    print(ds);
    return data;
  }
}
