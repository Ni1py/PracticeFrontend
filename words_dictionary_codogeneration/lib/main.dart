import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/my_scaffold.dart';

part 'main.g.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

@cwidget
Widget myApp(BuildContext context, WidgetRef ref) {

  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MyScaffold(),
    debugShowCheckedModeBanner: false,
  );
}
