import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/database/auth_services.dart';
import 'package:firebaseauth/login/login_with_google.dart';
import 'package:firebaseauth/screens/home_screen.dart';
import 'package:firebaseauth/screens/sign_up.dart';
import 'package:firebaseauth/widgets/footer_widget.dart';
import 'package:firebaseauth/widgets/my_button.dart';
import 'package:firebaseauth/widgets/show_snack_bar.dart';
import 'package:firebaseauth/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController forgotPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    String res = await AuthServices().LoginUser(
      email: emailController.text,
      password: passwordController.text,
    );
    if (res == "Success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
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
                child: Image.asset("assets/images/login.jpg"),
              ),
              //SizedBox(height: 0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: TextFieldWidget(
                    iconImage: Icons.email,
                    hintText: "Enter your email",
                    textController: emailController,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: TextFieldWidget(
                  iconImage: Icons.lock,
                  hintText: "Enter your password",
                  textController: passwordController,
                  ispass: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20, right: 44),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Forgot your Password",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  //hoverColor: Colors.red,
                                  splashColor: Colors.red,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close),
                                ),
                              ],
                            ),

                            content: Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: TextFieldWidget(
                                labelText: "Enter your email",
                                hintText: "eg: abc@gmail.com",
                                iconImage: null,
                                textController: forgotPasswordController,
                                isFocussedBorder: false,
                                isBorderCircular: false,
                                isBorderPresent: true,
                              ),
                            ),
                            actions: [
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    //fixedSize: Size(30, 20),
                                  ),
                                  // style: ButtonStyle(
                                  //   backgroundColor: WidgetStatePropertyAll(
                                  //     Colors.blue,
                                  //   ),
                                  //   minimumSize: WidgetStatePropertyAll(
                                  //     Size(20, 10),
                                  //   ),
                                  // ),
                                  onPressed: () async {
                                    await FirebaseAuth.instance
                                        .sendPasswordResetEmail(
                                          email: forgotPasswordController.text,
                                        )
                                        .then((value) {
                                          showSnackBar(
                                            context,
                                            "Password reset mail sent to your email.",
                                          );
                                        })
                                        .onError((error, StackTracer) {
                                          showSnackBar(
                                            context,
                                            error.toString(),
                                          );
                                        });
                                    Navigator.pop(context);
                                    passwordController.clear();
                                  },
                                  child: Text(
                                    "Send",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
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
              MyButton(
                displayText: "Login",
                buttonAction: () {
                  loginUser();
                },
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: Container(color: Colors.black26, height: 1)),
                  Text("or"),
                  Expanded(child: Container(color: Colors.black26, height: 1)),
                ],
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.grey),
                  ),
                  onPressed: () async {
                    await FirebaseServices().signInWithGoogle();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.grey,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 25,
                          child: Image.asset("assets/images/google-symbol.png"),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

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
