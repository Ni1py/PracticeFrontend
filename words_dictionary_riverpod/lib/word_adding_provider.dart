import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/language.dart';
import 'package:words_dictionary_riverpod/data/word.dart';
import 'package:words_dictionary_riverpod/data/words_service.dart';

class WordAddingModel {
  WordAddingModel(this._words);

  final List<Word> _words;
  List<Word> get words => _words;
}

class WordAddingNotifier extends StateNotifier<WordAddingModel> {
  WordAddingNotifier() : super(WordAddingModel(getWords()));

  String _wordRu = '';
  String _wordEn = '';
  String _wordGe = '';
  String _wordFr = '';

  set wordRu(String value) => _wordRu = value;

  set wordEn(String value) => _wordEn = value;

  set wordGe(String value) => _wordGe = value;

  set wordFr(String value) => _wordFr = value;

  void clear() {
    _wordRu = '';
    _wordEn = '';
    _wordGe = '';
    _wordFr = '';
  }

  void addWord() {
    if (_wordRu != '' && _wordEn != '' && _wordGe != '' && _wordFr != '') {
      state = WordAddingModel([
        ...state._words,
        Word(
          translations: {
            Language.russian: _wordRu,
            Language.english: _wordEn,
            Language.german: _wordGe,
            Language.french: _wordFr,
          },
          id: state._words.length + 1,
        )
      ]);
    }
  }

  void deleteWord() {
    state = WordAddingModel([
      for (var word in state._words)
        if (word.id != state._words.length) word
    ]);
  }
}

final wordAddingProvider =
    StateNotifierProvider<WordAddingNotifier, WordAddingModel>(
        (_) => WordAddingNotifier());
