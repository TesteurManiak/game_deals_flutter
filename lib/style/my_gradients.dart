import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGradients {
  static const buyBtn = LinearGradient(
    colors: [
      Color(0xFFFF7338),
      Color(0xFFF54732),
    ],
  );

  static final disabledBtn = LinearGradient(colors: [
    Colors.grey[200]!,
    Colors.grey[400]!,
  ]);
}
