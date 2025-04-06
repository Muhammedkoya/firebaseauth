import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/database/auth_services.dart';
import 'package:firebaseauth/login/login_with_google.dart';
import 'package:firebaseauth/screens/login_screen.dart';
import 'package:firebaseauth/widgets/my_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You are Successfully logged in!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          MyButton(
            displayText: "Log out",
            buttonAction: () async {
              await FirebaseServices().signOutWithGoogle();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          SizedBox(height: 20),
          //Image.network("${FirebaseAuth.instance.currentUser!.photoURL}"),
          Text(
            "${FirebaseAuth.instance.currentUser!.email}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text("${FirebaseAuth.instance.currentUser!.displayName}"),
        ],
      ),
    );
  }
}
