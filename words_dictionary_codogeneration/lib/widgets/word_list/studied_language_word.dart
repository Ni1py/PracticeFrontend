import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/word.dart';
import 'package:words_dictionary_codogeneration/providers/translation_language_provider.dart';
import 'package:words_dictionary_codogeneration/styles/text_style_general.dart';

part 'studied_language_word.g.dart';

@cwidget
Widget _studiedLanguageWord(
  WidgetRef ref,
  Word word,
  Color color,
) {
  final _translationLanguage = ref.watch(translationLanguageProvider);

  return Text(
    word.translations[_translationLanguage] ?? '',
    style: textStyleGeneral(color),
  );
}
