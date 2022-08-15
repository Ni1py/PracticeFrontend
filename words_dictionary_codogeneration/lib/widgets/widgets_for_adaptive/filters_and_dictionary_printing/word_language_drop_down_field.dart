import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/word_language_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/language_drop_down_field.dart';

part 'word_language_drop_down_field.g.dart';

@cwidget
Widget _wordLanguageDropdownField(WidgetRef ref) {
  final _language = ref.watch(topicLanguageFiltersProvider).topicLanguage;
  final _wordLanguage = ref.watch(wordLanguageProvider);

  return LanguageDropdownField(
    topicWordText.translations[_language] ?? '',
    _wordLanguage,
    (Language value) =>
        ref.read(wordLanguageProvider.notifier).update((_) => value),
  );
}
