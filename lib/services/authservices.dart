import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_cafe/view/login_page.dart';

class AuthServices {
  static FirebaseAuth authInstance = FirebaseAuth.instance;
  static Stream<User?> authStatus() {
    return authInstance.authStateChanges();
  }

  static Future<UserCredential> login(String email, String password) {
    return authInstance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<UserCredential> signUp(String email, String password) {
    return authInstance.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<void> logout() {
    return authInstance.signOut();
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static void signout(BuildContext context) async {
    await authInstance.signOut().then((value) {
      GoogleSignIn().signOut().then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ));
      });
    });
  }
}
