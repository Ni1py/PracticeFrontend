import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/data/word.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/styles/outline_input_border.dart';

part 'translation_form_text_field.g.dart';

@cwidget
Widget _translationFormTextField(
  WidgetRef ref,
  Word hintContent,
  Function(String)? onChanged,
) {
  final _topicTextColor = ref.watch(topicThemeProvider).topicTextColor;
  final _topicColor = ref.watch(topicThemeProvider).topicColor;
  final _language = ref.watch(topicLanguageFiltersProvider).topicLanguage;

  return TextField(
    style: TextStyle(color: _topicTextColor),
    decoration: InputDecoration(
      focusedBorder: outlineInputBorder(_topicTextColor),
      enabledBorder: outlineInputBorder(_topicTextColor),
      hintText: hintContent.translations[_language] ?? '',
      hintStyle: TextStyle(color: _topicTextColor),
      fillColor: _topicColor,
      filled: true,
    ),
    onChanged: onChanged,
  );
}
