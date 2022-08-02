import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/print_words_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/word_adding_provider.dart';
import 'package:words_dictionary_codogeneration/styles/style.dart';

part 'print_button.g.dart';

@cwidget
Widget printButton(BuildContext context, WidgetRef ref) {
  final wordIds = ref.watch(printProvider).wordIds;
  final wordsLength = wordIds.length;
  final wordsLengthString = wordsLength == 0
      ? ''
      : ' $wordsLength ${topicText.translations[ref.watch(topicLanguageFiltersProvider).topicLanguage]}';

  return TextButton(
    style: TextButton.styleFrom(
      primary: ref.watch(topicThemeProvider).topicTextColor,
      textStyle: const TextStyle(fontSize: fontSize),
    ),
    onPressed: () => ((wordsLength == 0)
        ? null
        : ref.watch(printProvider).printWords(
            ref.watch(languageFiltersProvider),
            ref.watch(wordAddingProvider).words)),
    child: Text(
        '${topicPrintText.translations[ref.watch(topicLanguageFiltersProvider).topicLanguage]}$wordsLengthString'),
  );
}