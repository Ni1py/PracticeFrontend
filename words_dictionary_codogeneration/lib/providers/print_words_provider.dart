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
    final result =
        words.where((word) => _wordIds.contains(word.id)).map((word) {
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
