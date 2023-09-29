import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_cafe/auth_checker.dart';
import 'package:movie_cafe/class/responsive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const AuthChecker(),
        ));
      },
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/my.gif')),
            gradient: LinearGradient(colors: [
              Color.fromARGB(223, 242, 115, 115),
              Color.fromARGB(255, 201, 26, 26)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: Mobile1.width(170, context),
              left: Mobile1.width(140, context)),
          child: Text(
            'Movie Cafe',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: Mobile1.width(34, context)),
          ),
        ),
      ),
    );
  }
}
