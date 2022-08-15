import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/word.dart';
import 'package:words_dictionary_codogeneration/providers/print_words_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';

part 'word_checkbox.g.dart';

@cwidget
Widget _wordCheckbox(
  WidgetRef ref,
  Word word,
  TopicThemeFiltersModel modelTopicColor,
) {
  final _wordIds = ref.watch(printProvider).wordIds;

  return Checkbox(
    checkColor: modelTopicColor.topicColor,
    fillColor: MaterialStateProperty.resolveWith<Color>(
      (states) => modelTopicColor.topicTextColor,
    ),
    value: _wordIds.contains(word.id),
    onChanged: (value) => ((value ?? false)
        ? ref.read(printProvider.notifier).addWord
        : ref.read(printProvider.notifier).removeWord)(word.id),
  );
}
