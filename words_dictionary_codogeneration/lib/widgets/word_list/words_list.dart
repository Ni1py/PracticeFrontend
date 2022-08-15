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
  final _words = ref.watch(wordAddingProvider).words;
  final _theme = ref.watch(topicThemeProvider);

  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: _words.length,
      itemBuilder: (_, index) {
        final _word = _words[index];

        return Row(
          children: [
            Expanded(
              flex: 6,
              child: NativeLanguageWord(_word, _theme.topicTextColor),
            ),
            Expanded(
              flex: 6,
              child: StudiedLanguageWord(_word, _theme.topicTextColor),
            ),
            Expanded(flex: 1, child: WordCheckbox(_word, _theme)),
            Expanded(child: DeleteButton(_word)),
          ],
        );
      },
    ),
  );
}
