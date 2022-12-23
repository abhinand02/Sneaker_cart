import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_cart/Services/auth.dart';

import '../Constants/firebase_constants.dart';
import '../Widgets/bottom_nav_bar.dart';

class DatabaseServic {
  final AuthService _auth = AuthService();
  late User? currentUser = _auth.auth.currentUser;
  late CollectionReference usersCollection = _auth.firestore.collection(userscollection);
  late CollectionReference productCollection =
      _auth.firestore.collection(productscollection);
  late CollectionReference cartCollection =
      _auth.firestore.collection(cartcollection);

  Future<QuerySnapshot<Object?>> getData() async {
    QuerySnapshot querySnapshot = await productCollection.get();
    // final allData =   querySnapshot.docs;
    print((querySnapshot.docs[0].data() as Map<String, dynamic>)['brand']);
    return querySnapshot;
  }

  Future<QuerySnapshot<Object?>> getNewArrival(
      String field, dynamic condition) async {
    final QuerySnapshot querySnapshot =
        await productCollection.where(field, isEqualTo: condition).get();
    // print((querySnapshot.docs[0].data() as Map<String, dynamic>)['product_name']);
    return querySnapshot;
  }

  Future<DocumentSnapshot<Object?>> getProduct(String docName) async {
    final querySnapshot = await productCollection.doc(docName).get();
    print(querySnapshot.data());
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
      print('qwer $e');
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
    DocumentReference store =
        usersCollection.doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      // 'cart': FieldValue.arrayUnion([
      //   {
      //     'product_name': '',
      //     'image': '',
      //     'size': '',
      //     'quantity': '',
      //     'total_price': '',
      //   }
      // ])
    });
  }

 Future addToCart({required String productName, required image, required size, required quantity, required totalPrice }) async {
   await usersCollection.doc(currentUser!.uid).update({
      'cart': FieldValue.arrayUnion([
        {
          'product_name': productName,
          'image': image,
          'size': '8',
          'quantity': quantity,
          'total_price': totalPrice,
        }
      ])
    });
  }
}
