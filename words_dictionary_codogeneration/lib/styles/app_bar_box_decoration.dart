import 'package:flutter/material.dart';

BoxDecoration appBarBoxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromARGB(255, 138, 10, 161),
        Color.fromARGB(255, 12, 184, 87),
      ],
    ),
  );
}
