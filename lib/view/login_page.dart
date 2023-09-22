import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_cafe/class/responsive.dart';
import 'package:movie_cafe/view/home.dart';
import 'package:movie_cafe/view/signup_page.dart';

import '../utilities/textfield.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

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
                    const Textfield1(),
                    SizedBox(
                      height: Mobile1.height(20, context),
                    ),
                    const Textfield2(),
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: Mobile1.width(15, context),
                          fontWeight: FontWeight.w700,
                          color: Colors.red[700]),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
