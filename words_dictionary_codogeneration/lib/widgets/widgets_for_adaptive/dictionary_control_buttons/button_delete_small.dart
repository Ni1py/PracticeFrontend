import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/print_words_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/word_adding_provider.dart';
import 'package:words_dictionary_codogeneration/styles/style.dart';

part 'button_delete_small.g.dart';

@cwidget
Widget buttonDeleteSmall(BuildContext context, WidgetRef ref) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: ref.watch(topicThemeProvider).topicButtonColor),
      onPressed: () {
        ref
            .read(printProvider.notifier)
            .removeWord(ref.watch(wordAddingProvider).words.length);
        ref.read(wordAddingProvider.notifier).deleteWord();
      },
      child: Text(
        topicDeleteButtonText.translations[
                ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
            '',
        style: const TextStyle(fontSize: fontSize),
      ),
    ),
  );
}
