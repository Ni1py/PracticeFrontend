import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/language_medium_drop_down_field.dart';

part 'word_medium_language_drop_down_field.g.dart';

@cwidget
Widget _wordMediumLanguageDropdownField(WidgetRef ref) {
  return LanguageMediumDropdownField(
    topicWordText.translations[
            ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
        '',
    ref.watch(languageFiltersProvider).wordLanguage,
    (Language value) => ref
        .read(languageFiltersProvider.notifier)
        .update((state) => LanguageFiltersModel(
              value,
              state.translationLanguage,
            )),
  );
}
