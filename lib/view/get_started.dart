import 'package:flutter/material.dart';
import 'package:movie_cafe/class/responsive.dart';
import 'package:movie_cafe/view/login_page.dart';

class GetStarted1 extends StatelessWidget {
  const GetStarted1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Mobile1.width(280, context),
            ),
            Image.asset(
              'assets/images/My project (3).png',
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: Mobile1.width(40, context),
            ),
            Center(
              child: Text(
                'All your favourite movies\n            in one Click',
                style: TextStyle(
                    fontFamily: 'serif',
                    fontWeight: FontWeight.w700,
                    fontSize: Mobile1.width(28, context)),
              ),
            ),
            SizedBox(
              height: Mobile1.width(30, context),
            ),
            SizedBox(
              height: Mobile1.width(45, context),
              width: Mobile1.width(145, context),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700]),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: Mobile1.width(20, context)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
