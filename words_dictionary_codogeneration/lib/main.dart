import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/scaffold.dart' as scaffold;

part 'main.g.dart';

void main() => runApp(const ProviderScope(child: WordDictionaryApp()));

@swidget
Widget _wordDictionaryApp(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: scaffold.Scaffold(),
      debugShowCheckedModeBanner: false,
    );
