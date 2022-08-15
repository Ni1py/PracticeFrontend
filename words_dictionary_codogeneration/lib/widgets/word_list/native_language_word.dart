import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/word.dart';
import 'package:words_dictionary_codogeneration/providers/word_language_provider.dart';
import 'package:words_dictionary_codogeneration/styles/text_style_general.dart';

part 'native_language_word.g.dart';

@cwidget
Widget _nativeLanguageWord(
  WidgetRef ref,
  Word word,
  Color color,
) {
  final _wordLanguage = ref.watch(wordLanguageProvider);

  return Text(
    word.translations[_wordLanguage] ?? '',
    style: textStyleGeneral(color),
  );
}
