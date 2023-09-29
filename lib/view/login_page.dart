import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_cafe/class/responsive.dart';

import 'package:movie_cafe/view/signup_page.dart';
import '../services/authservices.dart';
import '../widget/textfield.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
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
                          child:
                              Image.asset('assets/images/My project (4).png')),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: Mobile1.width(36, context)),
                    ),
                    SizedBox(
                      height: Mobile1.height(4, context),
                    ),
                    Text(
                      'Please sign in to continue',
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
                      height: Mobile1.width(8, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forget Password ?',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.red[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Mobile1.width(40, context),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          if (email.text.isEmpty && password.text.isEmpty) {
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
                          } else {
                            try {
                              await AuthServices.login(
                                  email.text, password.text);
                            } on FirebaseAuthException catch (e) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(e.code
                                      .toUpperCase()
                                      .replaceAll("-", " ")),
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
                          height: Mobile1.width(46, context),
                          width: Mobile1.width(130, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red[700]),
                          alignment: Alignment.center,
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: Mobile1.width(18, context)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Mobile1.width(130, context),
              ),
              Center(
                  child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: Mobile1.width(15, context),
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(120, 0, 0, 0)),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: Mobile1.width(15, context),
                          fontWeight: FontWeight.w700,
                          color: Colors.red[700]),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
