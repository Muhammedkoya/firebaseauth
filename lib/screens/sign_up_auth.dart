import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpAuth {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> SignUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";

    try {
      UserCredential userAuthCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firebase.collection("Users").doc(userAuthCredential.user!.uid).set(
        {"name": name, "email": email, "UId": userAuthCredential.user!.uid},
      );

      res = "Success";
    } catch (e) {
      print(e.toString());
    }

    return res;
  }
}
