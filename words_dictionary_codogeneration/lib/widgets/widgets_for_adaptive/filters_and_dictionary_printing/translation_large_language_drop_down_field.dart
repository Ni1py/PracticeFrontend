import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/language_large_drop_down_field.dart';

part 'translation_large_language_drop_down_field.g.dart';

@cwidget
Widget translationLargeLanguageDropdownField(
  BuildContext context,
  WidgetRef ref,
) {
  return LanguageLargeDropdownField(
    topicTranslationText.translations[
            ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
        '',
    ref.watch(languageFiltersProvider).translationLanguage,
    (Language value) => ref
        .read(languageFiltersProvider.notifier)
        .update((state) => LanguageFiltersModel(
              state.wordLanguage,
              value,
            )),
  );
}
