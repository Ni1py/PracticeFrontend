import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/data/word.dart';
import 'package:words_dictionary_codogeneration/data/words_service.dart';

class WordAddingModel {
  WordAddingModel(this._words);

  final List<Word> _words;
  List<Word> get words => _words;
}

class WordAddingNotifier extends StateNotifier<WordAddingModel> {
  WordAddingNotifier() : super(WordAddingModel(getWords()));

  int _getMaxId() {
    return state._words
        .map((word) => word.id)
        .reduce((value, element) => value > element ? value : element);
  }

  bool _isMapElementEmpty(Map<Language, String> translations) {
    return Language.values
        .every((language) => translations.containsKey(language)); //.every(каждый), .any(хотя бы 1)
  }

  void addWord(Map<Language, String> translations) {
    if (_isMapElementEmpty(translations)) {
      state = WordAddingModel([
        ...state._words,
        Word(
          translations: translations,
          id: _getMaxId() + 1,
        ),
      ]);
    }
  }

  void deleteWord(int index) {
    state = WordAddingModel([
      ...state.words.where((w) => w.id != index),
    ]);
  }
}

final wordAddingProvider =
    StateNotifierProvider<WordAddingNotifier, WordAddingModel>(
  (_) => WordAddingNotifier(),
);
