import 'package:words_dictionary/data/language.dart';

class Word {
  Word({
    required this.translations,
    required this.id,
  });

  final int id;
  final Map<Language, String> translations;
}
