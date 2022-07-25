import 'package:flutter/material.dart';
import 'package:words_dictionary/data/word.dart';
import 'package:words_dictionary/print_words_provider.dart';
import 'package:words_dictionary/style.dart';
import 'package:words_dictionary/language_filters_provider.dart';
import 'package:words_dictionary/topic_theme_filters_provider.dart';
import 'package:words_dictionary/word_adding_provider.dart';

class WordsList extends StatelessWidget {
  const WordsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = TopicThemeFiltersInheritedNotifier.of(context);
    final modelWords = WordAddingInheritedNotifier.of(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: modelWords.words.length,
      itemBuilder: (_, index) {
        final word = modelWords.words[index];

        return Row(
          children: [
            Expanded(flex: 6, child: _NativeLanguageWord(word: word, color: model.topicTextColor)),
            Expanded(flex: 6, child: _StudiedLanguageWord(word: word, color: model.topicTextColor)),
            Expanded(flex: 1, child: _WordCheckbox(word: word, modelTopicColor: model)),
          ],
        );
      },
    );
  }
}
  
class _NativeLanguageWord extends StatelessWidget {
  const _NativeLanguageWord({Key? key, required this.word, required this.color}) : super(key: key);

  final Word word;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      word.translations[
              LanguageFiltersInheritedNotifier.of(context).wordLanguage] ??
          '',
      style: TextStyle(fontSize: fontSize, color: color),
    );
  }
}

class _StudiedLanguageWord extends StatelessWidget {
  const _StudiedLanguageWord({Key? key, required this.word, required this.color}) : super(key: key);

  final Word word;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      word.translations[LanguageFiltersInheritedNotifier.of(context)
              .translationLanguage] ??
          '',
      style: TextStyle(fontSize: fontSize, color: color),
    );
  }
}

class _WordCheckbox extends StatelessWidget {
  const _WordCheckbox({Key? key, required this.word, required this.modelTopicColor}) : super(key: key);

  final Word word;
  final TopicThemeFiltersModel modelTopicColor;

  @override
  Widget build(BuildContext context) {
    final model = PrintWordsInheritedNotifier.of(context);

    return Checkbox(
      checkColor: modelTopicColor.topicColor,
      fillColor: MaterialStateProperty.resolveWith<Color>((states) => modelTopicColor.topicTextColor),
      value: model.wordIds.contains(word.id),
      onChanged: (bool? value) =>
          ((value ?? false) ? model.addWord : model.removeWord)(word.id),
    );
  }
}
