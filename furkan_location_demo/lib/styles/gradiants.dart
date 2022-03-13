import 'package:flutter/material.dart';

class AppGradiant {
  static const linerGradiant = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0.1,
      0.4,
      0.6,
      0.9,
    ],
    colors: [
      Colors.yellow,
      Colors.red,
      Colors.indigo,
      Colors.teal,
    ],
  );
}
