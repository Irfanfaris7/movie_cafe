import 'package:flutter/material.dart';

class Mobile1 {
  static double width(double width, BuildContext context) {
    return MediaQuery.of(context).size.width * (width / 375);
  }

  static double height(double height, BuildContext context) {
    return MediaQuery.of(context).size.height * (height / 812);
  }
}