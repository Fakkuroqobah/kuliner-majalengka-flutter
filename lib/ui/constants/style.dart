import 'package:flutter/material.dart';

class Style {
  // Color
  static const Color primary = Color(0xffF9A826);
  static const Color secondary = Color(0xffF8F8F8);

  // Text Style
  static const TextStyle textAppBar = TextStyle(
    fontFamily: 'Cookie',
    fontSize: 28.0,
    fontWeight: FontWeight.w500
  );

  static const TextStyle thick = TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.w300,
    fontSize: 13.0
  );

  static const TextStyle bold = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 16.0
  );

  static const TextStyle heading = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 32.0
  );
}