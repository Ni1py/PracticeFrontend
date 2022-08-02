import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/providers/widgets_changer_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/appbar_drop_down_fieds/topic_color_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/appbar_drop_down_fieds/topic_language_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/home_page.dart';

part 'my_scaffold.g.dart';

@cwidget
Widget myScaffold(BuildContext context, WidgetRef ref) {
  final mediaQueryData = MediaQuery.of(context);
  Future.microtask(
    () => ref
        .read(widgetsChangerProvider.notifier)
        .changeWidgetsInTree(mediaQueryData.size.width),
  );

  return Scaffold(
    drawer: ref.watch(widgetsChangerProvider).drawer,
    appBar: AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color.fromARGB(255, 138, 10, 161),
              Color.fromARGB(255, 12, 184, 87),
            ],
          ),
        ),
      ),
      title: const Text('Words Dictionary'),
      actions: [
        TopicLanguageDropDownField(),
        TopicColorDropDownField(),
      ],
    ),
    body: const HomePage(),
  );
}
