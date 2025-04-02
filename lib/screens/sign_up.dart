import 'package:firebaseauth/screens/login_screen.dart';
import 'package:firebaseauth/widgets/footer_widget.dart';
import 'package:firebaseauth/widgets/my_button.dart';
import 'package:firebaseauth/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SizedBox(height: 30),
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/images/sign_up2.jpg"),
              ),
              //SizedBox(height: 0),
              TextFieldWidget(
                iconImage: Icons.person,
                hintText: "Enter your name",
                textController: emailController,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                iconImage: Icons.email,
                hintText: "Enter your email",
                textController: emailController,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                iconImage: Icons.lock,
                hintText: "Enter your password",
                textController: passwordController,
              ),
              SizedBox(height: 20),

              MyButton(displayText: "Sign Up"),
              SizedBox(height: 20),
              FooterWidget(
                footerHeading1: "Already have an account? ",
                footerHeading2: "Login",
                targetPage: LoginScreen(),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Already have an account? ",
              //       style: TextStyle(color: Colors.grey[800]),
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) {
              //               return LoginScreen();
              //             },
              //           ),
              //         );
              //       },
              //       child: Text("Login", style: TextStyle(color: Colors.black)),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
