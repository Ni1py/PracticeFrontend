import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/word_adding_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/word_list/delete_button.dart';
import 'package:words_dictionary_codogeneration/widgets/word_list/native_language_word.dart';
import 'package:words_dictionary_codogeneration/widgets/word_list/studied_language_word.dart';
import 'package:words_dictionary_codogeneration/widgets/word_list/word_checkbox.dart';

part 'words_list.g.dart';

@cwidget
Widget _wordsList(WidgetRef ref) {
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: ref.watch(wordAddingProvider).words.length,
      itemBuilder: (_, index) {
        final word = ref.watch(wordAddingProvider).words[index];

        return Row(
          children: [
            Expanded(
              flex: 6,
              child: NativeLanguageWord(
                word,
                ref.watch(topicThemeProvider).topicTextColor,
              ),
            ),
            Expanded(
              flex: 6,
              child: StudiedLanguageWord(
                word,
                ref.watch(topicThemeProvider).topicTextColor,
              ),
            ),
            Expanded(
              flex: 1,
              child: WordCheckbox(word, ref.watch(topicThemeProvider)),
            ),
            Expanded(
              child: DeleteButton(word),
            ),
          ],
        );
      },
    ),
  );
}
