// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words_list.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class WordsList extends ConsumerWidget {
  const WordsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      wordsList(_context, _ref);
}

class NativeLanguageWord extends ConsumerWidget {
  const NativeLanguageWord(this.word, this.color, {Key? key}) : super(key: key);

  final Word word;

  final Color color;

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      nativeLanguageWord(_context, _ref, word, color);
}

class StudiedLanguageWord extends ConsumerWidget {
  const StudiedLanguageWord(this.word, this.color, {Key? key})
      : super(key: key);

  final Word word;

  final Color color;

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      studiedLanguageWord(_context, _ref, word, color);
}

class WordCheckbox extends ConsumerWidget {
  const WordCheckbox(this.word, this.modelTopicColor, {Key? key})
      : super(key: key);

  final Word word;

  final TopicThemeFiltersModel modelTopicColor;

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      wordCheckbox(_context, _ref, word, modelTopicColor);
}
