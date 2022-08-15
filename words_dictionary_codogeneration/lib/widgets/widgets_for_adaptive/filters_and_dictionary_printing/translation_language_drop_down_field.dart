import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/translation_language_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/language_drop_down_field.dart';

part 'translation_language_drop_down_field.g.dart';

@cwidget
Widget _translationLanguageDropdownField(WidgetRef ref) {
  final _translationLanguage = ref.watch(translationLanguageProvider);
  final _language = ref.watch(topicLanguageFiltersProvider).topicLanguage;

  return LanguageDropdownField(
    topicTranslationText.translations[_language] ?? '',
    _translationLanguage,
    (Language value) =>
        ref.read(translationLanguageProvider.notifier).update((_) => value),
  );
}
