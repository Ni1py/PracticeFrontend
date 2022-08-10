import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';

final languageFiltersProvider = StateProvider<LanguageFiltersModel>((_) {
  return LanguageFiltersModel(Language.russian, Language.english);
});

@immutable
class LanguageFiltersModel {
  LanguageFiltersModel(this._wordLanguage, this._translationLanguage);
  final Language _wordLanguage;
  final Language _translationLanguage;
  Language get wordLanguage => _wordLanguage;
  Language get translationLanguage => _translationLanguage;
}

// @immutable
// class LanguageFiltersModel {
//   LanguageFiltersModel(this._wordLanguage, this._translationLanguage);

//   final Language _wordLanguage;
//   final Language _translationLanguage;
//   Language get wordLanguage => _wordLanguage;
//   Language get translationLanguage => _translationLanguage;
// }

// class LanguageFiltersNotifier extends StateNotifier<LanguageFiltersModel> {
//   LanguageFiltersNotifier()
//       : super(LanguageFiltersModel(Language.russian, Language.english));

//   void wordLanguage(Language value) {
//     state = LanguageFiltersModel(value, state._translationLanguage);
//   }

//   void translationLanguage(Language value) {
//     state = LanguageFiltersModel(state._wordLanguage, value);
//   }
// }

// final languageFiltersProvider =
//     StateNotifierProvider<LanguageFiltersNotifier, LanguageFiltersModel>(
//   (_) => LanguageFiltersNotifier(),
// );

