import 'package:firebaseauth/database/auth_services.dart';
import 'package:firebaseauth/screens/home_screen.dart';
import 'package:firebaseauth/screens/login_screen.dart';
import 'package:firebaseauth/widgets/footer_widget.dart';
import 'package:firebaseauth/widgets/my_button.dart';
import 'package:firebaseauth/widgets/show_snack_bar.dart';
import 'package:firebaseauth/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  void SignUpUser() async {
    String res = await AuthServices().SignUpUser(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    if (res == "Success") {
      setState(() {});
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      setState(() {});
      showSnackBar(context, res);
    }
  }

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
                textController: nameController,
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
                ispass: true,
              ),
              SizedBox(height: 20),

              MyButton(
                displayText: "Sign Up",
                buttonAction: () {
                  SignUpUser();
                },
              ),
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
