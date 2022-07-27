import 'package:words_dictionary_riverpod/data/language.dart';

class TopicText {
  TopicText({
    required this.translations,
  });

  final Map<Language, String> translations;
}
