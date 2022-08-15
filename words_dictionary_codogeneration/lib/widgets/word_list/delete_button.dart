import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/word.dart';
import 'package:words_dictionary_codogeneration/providers/print_words_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/word_adding_provider.dart';

part 'delete_button.g.dart';

@cwidget
Widget _deleteButton(WidgetRef ref, Word word) {
  final _theme = ref.watch(topicThemeProvider).topicTextColor;

  return IconButton(
    onPressed: () {
      ref.read(printProvider.notifier).removeWord(word.id);
      ref.read(wordAddingProvider.notifier).deleteWord(word.id);
    },
    icon: Icon(Icons.cancel_sharp),
    color: _theme,
    //splashColor: Color.fromARGB(255, 12, 184, 135), - должно менять цвет при нажатии но не работает
  );
}
