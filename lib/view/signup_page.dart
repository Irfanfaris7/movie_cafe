import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_cafe/class/responsive.dart';
import 'package:movie_cafe/view/home.dart';

import '../utilities/textfield.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

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
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Name',
                        labelText: 'Username',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(223, 0, 0, 0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 225, 46, 33))),
                        prefixIcon: const Icon(Icons.person),
                        prefixIconColor: const Color.fromARGB(141, 0, 0, 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  SizedBox(
                    height: Mobile1.height(20, context),
                  ),
                  const Textfield1(),
                  SizedBox(
                    height: Mobile1.height(20, context),
                  ),
                  const Textfield2(),
                  SizedBox(
                    height: Mobile1.width(36, context),
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
                        radius: Mobile1.width(22, context),
                        backgroundImage: const AssetImage(
                            'assets/images/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png'),
                      ),
                      SizedBox(
                        width: Mobile1.width(6, context),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: Mobile1.width(22, context),
                        backgroundImage:
                            const AssetImage('assets/images/229098.png'),
                      ),
                      SizedBox(
                        width: Mobile1.width(6, context),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: Mobile1.width(22, context),
                        backgroundImage: const AssetImage(
                            'assets/images/twitter-logo-vector-png-clipart-1.png'),
                      ),
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
