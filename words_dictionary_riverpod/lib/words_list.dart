import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/word.dart';
import 'package:words_dictionary_riverpod/language_filters_state.dart';
import 'package:words_dictionary_riverpod/print_words_provider.dart';
//import 'package:words_dictionary_riverpod/print_words_provider.dart';
import 'package:words_dictionary_riverpod/style.dart';
import 'package:words_dictionary_riverpod/topic_theme_filters_provider.dart';
import 'package:words_dictionary_riverpod/word_adding_provider.dart';

class WordsList extends ConsumerWidget {
  const WordsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ref.watch(wordAddingProvider).words.length,
      itemBuilder: (_, index) {
        final word = ref.watch(wordAddingProvider).words[index];

        return Row(
          children: [
            Expanded(
                flex: 6,
                child: _NativeLanguageWord(
                    word: word,
                    color: ref.watch(topicThemeProvider).topicTextColor)),
            Expanded(
                flex: 6,
                child: _StudiedLanguageWord(
                    word: word,
                    color: ref.watch(topicThemeProvider).topicTextColor)),
            Expanded(
                flex: 1,
                child: _WordCheckbox(
                    word: word,
                    modelTopicColor: ref.watch(topicThemeProvider))),
          ],
        );
      },
    );
  }
}

class _NativeLanguageWord extends ConsumerWidget {
  const _NativeLanguageWord({Key? key, required this.word, required this.color})
      : super(key: key);

  final Word word;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      word.translations[ref.watch(languageFiltersProvider).wordLanguage] ?? '',
      style: TextStyle(fontSize: fontSize, color: color),
    );
  }
}

class _StudiedLanguageWord extends ConsumerWidget {
  const _StudiedLanguageWord(
      {Key? key, required this.word, required this.color})
      : super(key: key);

  final Word word;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      word.translations[
              ref.watch(languageFiltersProvider).translationLanguage] ??
          '',
      style: TextStyle(fontSize: fontSize, color: color),
    );
  }
}

class _WordCheckbox extends ConsumerWidget {
  const _WordCheckbox(
      {Key? key, required this.word, required this.modelTopicColor})
      : super(key: key);

  final Word word;
  final TopicThemeFiltersModel modelTopicColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
}
