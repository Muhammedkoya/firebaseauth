import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final googleSignIn = GoogleSignIn();

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
      print("i am here");
      res = "Success";
    } catch (e) {
      print("i am in catch");
      res = e.toString();
    }

    return res;
  }

  Future<String> LoginUser({
    //required String name,
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("i am in try");
      res = "Success";
    } catch (e) {
      print("i am in catch");
      res = e.toString();
    }

    return res;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
