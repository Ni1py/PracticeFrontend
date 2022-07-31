import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/words_service.dart'
    as words_service;
import 'package:words_dictionary_riverpod/language_filters_state.dart';

@immutable
class PrintWordsModel {
  const PrintWordsModel(this._wordIds);
  final Set<int> _wordIds;

  get wordIds => _wordIds;

  void printWords(LanguageFiltersModel model) {
    final result = words_service
        .getWords()
        .where((word) => _wordIds.contains(word.id))
        .map((word) {
      final translations = word.translations;

      return '${translations[model.wordLanguage]} - ${translations[model.translationLanguage]}';
    }).join("\n\r");

    print(result);
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
      state = PrintWordsModel({
        for (final word in state._wordIds)
          if (word != wordId) word
      });
    }
  }
}

final printProvider =
    StateNotifierProvider<PrintWordsNotifier, PrintWordsModel>((_) {
  return PrintWordsNotifier();
});
