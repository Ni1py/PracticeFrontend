import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/word.dart';
import 'package:words_dictionary_codogeneration/providers/language_filters_provider.dart';

@immutable
class PrintWordsModel {
  const PrintWordsModel(this._wordIds);
  final Set<int> _wordIds;

  Set<int> get wordIds => _wordIds;

  void printWords(LanguageFiltersModel model, List<Word> words) {
    final _result =
        words.where((word) => _wordIds.contains(word.id)).map((word) {
      final _translations = word.translations;

      return '${_translations[model.wordLanguage]} - ${_translations[model.translationLanguage]}';
    }).join("\n\r");

    print(_result);
  }
}

class PrintWordsNotifier extends StateNotifier<PrintWordsModel> {
  PrintWordsNotifier() : super(const PrintWordsModel(<int>{}));

  void addWord(int wordId) {
    if (!state._wordIds.contains(wordId)) {
      state = PrintWordsModel({...state.wordIds, wordId});
    }
  }

  void removeWord(int wordId) {
    if (state._wordIds.contains(wordId)) {
      state = PrintWordsModel({...state._wordIds.where((w) => w != wordId)});
    }
  }
}

final printProvider =
    StateNotifierProvider<PrintWordsNotifier, PrintWordsModel>((_) {
  return PrintWordsNotifier();
});
