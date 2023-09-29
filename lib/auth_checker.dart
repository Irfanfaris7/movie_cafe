import 'package:flutter/material.dart';
import 'package:movie_cafe/services/authservices.dart';
import 'package:movie_cafe/view/home.dart';
import 'package:movie_cafe/view/login_page.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthServices.authStatus(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return LoginPage();
        } else {
          return Home();
        }
      },
    );
  }
}
