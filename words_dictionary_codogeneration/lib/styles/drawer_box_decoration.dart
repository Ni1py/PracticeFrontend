import 'package:flutter/material.dart';

BoxDecoration drawerBoxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromARGB(255, 172, 34, 147),
        Color.fromARGB(255, 12, 184, 87),
      ],
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
}
