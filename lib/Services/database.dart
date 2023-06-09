import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sneaker_cart/Application/Cart/cart_bloc.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Services/auth.dart';
import '../Application/LazyLoading/lazy_loading_bloc.dart';
import '../Constants/firebase_constants.dart';
import '../Screens/Login&Registeration/login_page.dart';
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
      querySnapshot =
          await collectionObject.where(field, isEqualTo: condition).get();
      // print(querySnapshot.docs.isEmpty);
      return querySnapshot;
    } catch (e) {
      // print(e);
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
      BlocProvider.of<LazyLoadingBloc>(context).add(
        const started(loadingValue: false),
      );
      final snackbar = SnackBar(
        content: Text(
          e.message.toString(),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
      );

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
      final snackBar = SnackBar(content: Text(e.message.toString()));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return userCredential;
  }

  Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignInAccount? googleSignInAccount =
        await _auth.googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        currentUser = userCredential.user;
        // ignore: use_build_context_synchronously
        storeUserData(
            name: googleSignInAccount.displayName,
            email: googleSignInAccount.email,context: context);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const BottomNavBar()),
            (route) => false);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const BottomNavBar()),
              (route) => false);
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        print(e.toString());
      }
    }
    BlocProvider.of<LazyLoadingBloc>(context)
        .add(const started(loadingValue: false));

    return currentUser;
  }

  storeUserData({name, password, email, context}) async {
    try {
      DocumentReference store = usersCollection.doc(currentUser!.uid);
     await store.set({
        'name': name,
        'password': password,
        'email': email,
        'imageUrl': '',
      }).then((value) {
        BlocProvider.of<LazyLoadingBloc>(context)
            .add(const started(loadingValue: false));
        return Navigator.of(context,).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
            (route) => false);
      });
    } catch (e) {
      BlocProvider.of<LazyLoadingBloc>(context,).add(const started(loadingValue: false),);
    }
  }

  updateUSerData(
      {required String name,
      required String password,
      required String email}) async {
    usersCollection.doc(currentUser!.uid).update({
      'email': email,
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

  Future removeItem(
      {required String productName,
      required size,
      required quantity,
      required BuildContext context}) async {
    final data = await getNewArrival(
        field: 'user_id',
        condition: currentUser!.uid,
        collectionObject: cartCollection);
    final result = data.docs;
    final index = result.indexWhere((element) =>
        element['product_name'] == productName && element['size'] == size);
    await cartCollection.doc(result[index].id).delete().then((value) {
      BlocProvider.of<CartBloc>(context).add(const CartProduct());
      BlocProvider.of<CartBloc>(context).add(const SubTotal());
    });
  }

  Future addAddress(
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
        const snackbar = SnackBar(
          content: Text('Address Added Sucessfully'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      });
    } catch (e) {
      final snackbar = SnackBar(
        content: Text( 
          e.toString(),
        ),
      );
      // ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  Future updateAddress({required String number, required condition}) async {
    final data = await addressCollection
        .where(
          'address',
          isEqualTo: condition,
        )
        .get();
    final docId = data.docs[0].id;
    addressCollection.doc(docId).update({"number": number});
    // print(data.docs[0].id);
  }

  Future addOrderDetails({required String address}) async {
    final result = await DatabaseServic().getNewArrival(
        field: 'user_id',
        condition: currentUser!.uid,
        collectionObject: DatabaseServic().cartCollection);
    List data = [];
    var quantity;
    var subTotal;
    for (var element in result.docs) {
      final productName = element['product_name'];
      quantity = element['quantity'];
      final total = element['total_price'];
      final image = element['image'];
      final size = element['size'];
      subTotal =
          (int.parse(subTotal ?? '0') + int.parse(total) * int.parse(quantity))
              .toString();
      data.add({
        "product_name": productName,
        "quantity": quantity,
        "total": total,
        "image": image,
        "size": size,
      });
      // print(productName);
    }
    await orderCollection.doc().set({
      "order": FieldValue.arrayUnion(data),
      "user_id": currentUser!.uid,
      "date": DateTime.now(),
      "address": address,
      "order_status": 'Confirmed',
      "total_price": (int.parse(subTotal) + 40).toString(),
    });
    // for (var i = 0; i < result.docs.length; i++) {
    //   final data = result.docs[i].data() as Map<String, dynamic>;
    //   final prodctName = data['product_name'];
    //   final quantity = data['quantity'];
    //   final total = data['total_price'];
    //   final image = data['image'];
    //   await orderCollection.doc().set({
    //     "user_id": currentUser!.uid,
    //     "product_name": prodctName,
    //     "quantity": quantity,
    //     "total": (int.parse(total) * int.parse(quantity) + 40).toString(),
    //     "image": image,
    //     "date": DateTime.now(),
    //     "address": address,
    //     "order_status": 'Confirmed',
    //   });
    // }
    for (var i = 0; i < result.docs.length; i++) {
      await cartCollection.doc(result.docs[i].id).delete();
    }
  }

  getOrders() async {
    var result;
    final data = await orderCollection
        .orderBy(
          'date',
          descending: true,
        )
        .where('user_id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) => result = value.docs);
    // .orderBy(
    //   'date',
    //   descending: true,
    // )
    // .where('user_id', isEqualTo: currentUser!.uid)
    // .get();

    // print(result[0]['user_id']);
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
    dynamic data;
    try {
      data = await productCollection
          .orderBy('product_name')
          .startAt([searchKey]).get();
    } catch (e) {
      // print('Something went Wrong0');
    }
    // final ds = (data.docs[0].data() as Map<String, dynamic>)['product_name'];
    // print(ds);
    return data;
  }

  Future deleteAddress({required String docId}) async {
    addressCollection.doc(docId).delete();
  }

//   Future VerifyPhoneNumber(
//       {required String phoneNumber, required BuildContext context}) async {
//     await _auth.auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         timeout: const Duration(seconds: 60),
//         verificationCompleted: (AuthCredential authCredential) {
//           // _auth.auth.signInWithCredential(authCredential).then((result){
// // Navigator.pushReplacement(context, MaterialPageRoute(
// //     builder: (context) => HomeScreen(result.user)
// //   ));
//   print('action complete');
// // });
//         },
//         verificationFailed: (FirebaseAuthException authException) {
//           print(authException.message);
//         },
//         codeSent: (String verificationId, int? resendingCode) {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => VerifyOTP(verificationId: verificationId,),),);
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           verificationId = verificationId;
//           print(verificationId);
//           print('timeout');
//         });
//   }

  // void verification(){
  //   // print(currentUser!.email!);
  //  _auth.auth.sendPasswordResetEmail(email: 'abhinandmadhu08@gmail.com');
  // }
}
