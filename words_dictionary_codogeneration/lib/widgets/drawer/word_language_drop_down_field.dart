import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/drawer/language_drop_down_field.dart';

part 'word_language_drop_down_field.g.dart';

@cwidget
Widget _wordLanguageDropdownField(BuildContext context, WidgetRef ref) {
  return LanguageDropdownField(
    topicWordText.translations[
            ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
        '',
    ref.watch(languageFiltersProvider).wordLanguage,
    (Language value) {
      ref
          .read(languageFiltersProvider.notifier)
          .update((state) => LanguageFiltersModel(
                value,
                state.translationLanguage,
              ));
      Navigator.pop(context);
    },
  );
}
