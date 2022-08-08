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

  void addWord(String wordRu, String wordEn, String wordGe, String wordFr) {
    if (wordRu != '' && wordEn != '' && wordGe != '' && wordFr != '') {
      state = WordAddingModel([
        ...state._words,
        Word(
          translations: {
            Language.russian: wordRu,
            Language.english: wordEn,
            Language.german: wordGe,
            Language.french: wordFr,
          },
          id: state._words.length + 1,
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
