import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/home_page.dart';

part 'main.g.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

@swidget
Widget myApp(BuildContext context) {
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
                  colors: <Color>[
                Color.fromARGB(255, 138, 10, 161),
                Color.fromARGB(255, 12, 184, 87)
              ])),
        ),
        title: const Text('Words Dictionary'),
        actions: [
          TopicLanguageDropDownField(),
          TopicColorDropDownField(),
        ],
      ),
      body: const HomePage(),
    ),
    debugShowCheckedModeBanner: false,
  );
}
