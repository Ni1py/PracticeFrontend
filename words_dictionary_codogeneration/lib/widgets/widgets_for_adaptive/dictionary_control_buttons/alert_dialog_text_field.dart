import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/data/topic_text.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';

part 'alert_dialog_text_field.g.dart';

@cwidget
Widget alertDialogTextField(
  BuildContext context,
  WidgetRef ref,
  TopicText hintContent,
  Function(String)? onChanged,
) {
  return TextField(
    style: TextStyle(color: ref.watch(topicThemeProvider).topicTextColor),
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ref.watch(topicThemeProvider).topicTextColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ref.watch(topicThemeProvider).topicTextColor,
          width: 1,
        ),
      ),
      hintText: hintContent.translations[
              ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
          '',
      hintStyle: TextStyle(color: ref.watch(topicThemeProvider).topicTextColor),
      fillColor: ref.watch(topicThemeProvider).topicColor,
      filled: true,
    ),
    onChanged: onChanged,
  );
}
