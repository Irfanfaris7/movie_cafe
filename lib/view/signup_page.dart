import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_cafe/class/responsive.dart';
import 'package:movie_cafe/services/authservices.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_cafe/view/home2.dart';

import '../widget/textfield.dart';

class SignUp extends ConsumerWidget {
  SignUp({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                        height: Mobile1.width(200, context),
                        child: Image.asset('assets/images/My project (5).png')),
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: Mobile1.width(36, context)),
                  ),
                  SizedBox(
                    height: Mobile1.height(4, context),
                  ),
                  Text(
                    'Create account for free',
                    style: TextStyle(
                        color: const Color.fromARGB(147, 0, 0, 0),
                        fontSize: Mobile1.width(14, context),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: Mobile1.height(40, context),
                  ),
                  Textfield1(
                    controller: email,
                  ),
                  SizedBox(
                    height: Mobile1.height(20, context),
                  ),
                  Textfield2(
                    controller: password,
                  ),
                  SizedBox(
                    height: Mobile1.height(20, context),
                  ),
                  Textfield3(
                    controller: confirmpassword,
                  ),
                  SizedBox(
                    height: Mobile1.width(36, context),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (email.text.isEmpty &&
                            password.text.isEmpty &&
                            confirmpassword.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('EMPTY FIELD FOUND'),
                              content: Text(
                                'Fields cannot be empty',
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: const Text("Ok"),
                                ),
                              ],
                            ),
                          );
                        } else if (password.text != confirmpassword.text) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Invalid Fields'),
                              content: Text(
                                'Passwords must be same',
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: const Text("Ok"),
                                ),
                              ],
                            ),
                          );
                        } else {
                          try {
                            await AuthServices.signUp(
                                email.text, password.text);
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          } on FirebaseAuthException catch (e) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                    e.code.toUpperCase().replaceAll("-", " ")),
                                content: Text(
                                  e.message.toString(),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red[700],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    child: const Text("Ok"),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        height: Mobile1.width(48, context),
                        width: Mobile1.width(180, context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red[700]),
                        alignment: Alignment.center,
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Mobile1.width(18, context)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Mobile1.width(20, context),
                  ),
                  Center(
                      child: Text(
                    'or',
                    style: TextStyle(
                        fontSize: Mobile1.width(15, context),
                        fontWeight: FontWeight.w500),
                  )),
                  Center(
                    child: Text(
                      'Sign in with ',
                      style: TextStyle(
                          fontSize: Mobile1.width(15, context),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: Mobile1.width(20, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: Mobile1.width(18, context),
                        backgroundImage: const AssetImage(
                            'assets/images/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png'),
                      ),
                      SizedBox(
                        width: Mobile1.width(4, context),
                      ),
                      GestureDetector(
                        onTap: () {
                          try {
                            AuthServices.signInWithGoogle().then((value) {
                              if (value.user != null) {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return Home2();
                                  },
                                ));
                              }
                            });
                          } on FirebaseAuthException catch (e) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                    e.code.toUpperCase().replaceAll("-", " ")),
                                content: Text(
                                  e.message.toString(),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red[700],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    child: const Text("Ok"),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Google',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue[800],
                              fontSize: Mobile1.width(18, context),
                              fontWeight: FontWeight.w500),
                        ),
                      )
                      // CircleAvatar(
                      //   backgroundColor: Colors.white,
                      //   radius: Mobile1.width(22, context),
                      //   backgroundImage:
                      //       const AssetImage('assets/images/229098.png'),
                      // ),
                      // SizedBox(
                      //   width: Mobile1.width(6, context),
                      // ),
                      // CircleAvatar(
                      //   backgroundColor: Colors.white,
                      //   radius: Mobile1.width(22, context),
                      //   backgroundImage: const AssetImage(
                      //       'assets/images/twitter-logo-vector-png-clipart-1.png'),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
