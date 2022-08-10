import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/pages/adaptive_home_page.dart';
import 'package:words_dictionary_codogeneration/providers/display_mode_provider.dart';
import 'package:words_dictionary_codogeneration/styles/app_bar_box_decoration.dart';
import 'package:words_dictionary_codogeneration/widgets/appbar_drop_down_fieds/topic_color_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/appbar_drop_down_fieds/topic_language_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/drawer/default_drawer.dart';

part 'adaptive_scaffold.g.dart';

@swidget
Widget _adaptiveScaffold(BuildContext context) {
  return DisplayModeProvider.of(context) == DisplayMode.mobile
      ? DefaultScaffold(DefaultDrawer())
      : DefaultScaffold(null);
}

@swidget
Widget _defaultScaffold(Widget? drawer) {
  return Scaffold(
    drawer: drawer,
    appBar: AppBar(
      flexibleSpace: Container(
        decoration: appBarBoxDecoration(),
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
