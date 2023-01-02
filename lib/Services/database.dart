import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    final QuerySnapshot querySnapshot =
        await collectionObject.where(field, isEqualTo: condition).get();
    // print((querySnapshot.docs[0].data() as Map<String, dynamic>)['name']);
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

  // updateAddress({required String field, required condition})async{
  //  final data =  await addressCollection.where(field,isEqualTo: condition, whereIn: [{

  //  }]).get();
  //  data.docs[0];
  // }

  Future addOrderDetails() async {
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
        "date": DateTime.now()
      });
    }
    for (var i = 0; i < result.docs.length; i++) {
     await cartCollection.doc(result.docs[i].id).delete();
    }
  }
}
