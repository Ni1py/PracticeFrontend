import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/word.dart';
import 'package:words_dictionary_codogeneration/providers/language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/styles/style.dart';

part 'studied_language_word.g.dart';

@cwidget
Widget _studiedLanguageWord(
  WidgetRef ref,
  Word word,
  Color color,
) {
  return Text(
    word.translations[ref.watch(languageFiltersProvider).translationLanguage] ??
        '',
    style: TextStyle(fontSize: fontSize, color: color),
  );
}
