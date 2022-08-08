import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/providers/display_mode_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/appbar_drop_down_fieds/topic_color_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/appbar_drop_down_fieds/topic_language_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/adaptive_home_page.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/drawer/my_drawer.dart';

part 'adaptive_scaffold.g.dart';

@swidget
Widget _adaptiveScaffold(BuildContext context) {
  return DisplayModeProvider.of(context) == DisplayMode.mobile
      ? DefaultScaffold(MyDrawer())
      : DefaultScaffold(null);
}

@swidget
Widget _defaultScaffold(Widget? drawer) {
  return Scaffold(
    drawer: drawer,
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
    body: const AdaptiveHomePage(),
  );
}
