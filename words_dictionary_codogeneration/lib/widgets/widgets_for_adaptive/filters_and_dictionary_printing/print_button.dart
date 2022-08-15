import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/print_words_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/word_adding_provider.dart';
import 'package:words_dictionary_codogeneration/styles/text_style_general.dart';

part 'print_button.g.dart';

@cwidget
Widget _printButton(WidgetRef ref) {
  final _wordIds = ref.watch(printProvider).wordIds;
  final _theme = ref.watch(topicThemeProvider).topicTextColor;
  final _language = ref.watch(topicLanguageFiltersProvider).topicLanguage;
  final _languageFiltersModel = ref.watch(languageFiltersProvider);
  final _words = ref.watch(wordAddingProvider).words;
  final _wordsLength = _wordIds.length;
  final _wordsLengthString = _wordsLength == 0
      ? ''
      : ' $_wordsLength ${topicText.translations[_language]}';

  return TextButton(
    style: TextButton.styleFrom(
      primary: _theme,
      textStyle: textStyleGeneral(null),
    ),
    onPressed: () => ((_wordsLength == 0)
        ? null
        : ref.read(printProvider).printWords(_languageFiltersModel, _words)),
    child: Text('${topicPrintText.translations[_language]}$_wordsLengthString'),
  );
}
