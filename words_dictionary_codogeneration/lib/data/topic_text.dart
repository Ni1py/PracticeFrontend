import 'package:words_dictionary_codogeneration/data/language.dart';

class TopicText {
  TopicText({
    required this.translations,
  });

  final Map<Language, String> translations;
}
