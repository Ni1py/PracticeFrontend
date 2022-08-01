import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/data/word.dart';
import 'package:words_dictionary_codogeneration/providers/language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/print_words_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/word_adding_provider.dart';
import 'package:words_dictionary_codogeneration/styles/style.dart';

part 'words_list.g.dart';

@cwidget
Widget wordsList(BuildContext context, WidgetRef ref) {
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
                    word, ref.watch(topicThemeProvider).topicTextColor)),
            Expanded(
                flex: 6,
                child: StudiedLanguageWord(
                    word, ref.watch(topicThemeProvider).topicTextColor)),
            Expanded(
                flex: 1,
                child: WordCheckbox(word, ref.watch(topicThemeProvider))),
          ],
        );
      },
    ),
  );
}

@cwidget
Widget nativeLanguageWord(
    BuildContext context, WidgetRef ref, Word word, Color color) {
  return Text(
    word.translations[ref.watch(languageFiltersProvider).wordLanguage] ?? '',
    style: TextStyle(fontSize: fontSize, color: color),
  );
}

@cwidget
Widget studiedLanguageWord(
    BuildContext context, WidgetRef ref, Word word, Color color) {
  return Text(
    word.translations[ref.watch(languageFiltersProvider).translationLanguage] ??
        '',
    style: TextStyle(fontSize: fontSize, color: color),
  );
}

@cwidget
Widget wordCheckbox(BuildContext context, WidgetRef ref, Word word,
    TopicThemeFiltersModel modelTopicColor) {
  return Checkbox(
    checkColor: modelTopicColor.topicColor,
    fillColor: MaterialStateProperty.resolveWith<Color>(
        (states) => modelTopicColor.topicTextColor),
    value: ref.watch(printProvider).wordIds.contains(word.id),
    onChanged: (value) => ((value ?? false)
        ? ref.read(printProvider.notifier).addWord
        : ref.read(printProvider.notifier).removeWord)(word.id),
  );
}
