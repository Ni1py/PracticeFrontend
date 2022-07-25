import 'package:flutter/material.dart';
import 'package:words_dictionary/home_page.dart';
import 'package:words_dictionary/topic_language_filters_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color.fromARGB(255, 138, 10, 161), Color.fromARGB(255, 205, 12, 66)]
              )
            ),
          ),
          title: const Text('Words Dictionary'),
        ),
        body: const HomePage(),
      ),
    );
  }
}
