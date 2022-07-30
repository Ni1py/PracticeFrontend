import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/language.dart';

final languageFiltersProvider = StateProvider<LanguageFiltersModel>((_) {
  return LanguageFiltersModel(Language.russian, Language.english);
});

class LanguageFiltersModel {
  LanguageFiltersModel(this._wordLanguage, this._translationLanguage);
  Language _wordLanguage;
  Language get wordLanguage => _wordLanguage;
  set wordLanguage(Language value) {
    _wordLanguage = value;
  }

  Language _translationLanguage;
  Language get translationLanguage => _translationLanguage;
  set translationLanguage(Language value) {
    _translationLanguage = value;
  }
}
