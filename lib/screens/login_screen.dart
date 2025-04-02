import 'package:firebaseauth/screens/sign_up.dart';
import 'package:firebaseauth/widgets/footer_widget.dart';
import 'package:firebaseauth/widgets/my_button.dart';
import 'package:firebaseauth/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
                child: Image.asset("assets/images/login.jpg"),
              ),
              //SizedBox(height: 0),
              Center(
                child: TextFieldWidget(
                  iconImage: Icons.email,
                  hintText: "Enter your email",
                  textController: emailController,
                ),
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                iconImage: Icons.lock,
                hintText: "Enter your password",
                textController: passwordController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20, right: 44),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              MyButton(displayText: "Login"),
              SizedBox(height: 20),
              FooterWidget(
                footerHeading1: "Don't have an account? ",
                footerHeading2: "Sign Up",
                targetPage: SignUp(),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Don't have an account? ",
              //       style: TextStyle(color: Colors.grey[800]),
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) {
              //               return SignUp();
              //             },
              //           ),
              //         );
              //       },
              //       child: Text(
              //         "Signup",
              //         style: TextStyle(color: Colors.black),
              //       ),
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
