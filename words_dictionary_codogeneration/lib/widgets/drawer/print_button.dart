import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/print_words_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/word_adding_provider.dart';
import 'package:words_dictionary_codogeneration/styles/drawer_box_decoration.dart';
import 'package:words_dictionary_codogeneration/styles/text_style_general.dart';

part 'print_button.g.dart';

@cwidget
Widget _printButton(BuildContext context, WidgetRef ref) {
  final _wordIds = ref.watch(printProvider).wordIds;
  final _words = ref.read(wordAddingProvider).words;
  final _languageFiltersModel = ref.read(languageFiltersProvider);
  final _topicLanguage = ref.watch(topicLanguageFiltersProvider).topicLanguage;
  final _theme = ref.watch(topicThemeProvider).topicTextColor;
  final _wordsLength = _wordIds.length;
  final _wordsLengthString = _wordsLength == 0
      ? ''
      : ' $_wordsLength ${topicText.translations[_topicLanguage]}';

  return DecoratedBox(
    decoration: drawerBoxDecoration(),
    child: TextButton(
      style: TextButton.styleFrom(
        primary: _theme,
        textStyle: textStyleGeneral(null),
      ),
      onPressed: () {
        (_wordsLength == 0)
            ? null
            : ref.read(printProvider).printWords(_languageFiltersModel, _words);
        Navigator.pop(context);
      },
      child: Text(
        '${topicPrintText.translations[_topicLanguage]}$_wordsLengthString',
      ),
    ),
  );
}
