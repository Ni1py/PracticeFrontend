import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/providers/translation_language_provider.dart';
import 'package:words_dictionary_codogeneration/providers/word_language_provider.dart';

final languageFiltersProvider = StateProvider((ref) {
  final _wordLanguage = ref.watch(wordLanguageProvider);
  final _translationLanguage = ref.watch(translationLanguageProvider);

  return LanguageFiltersModel(_wordLanguage, _translationLanguage);
});

@immutable
class LanguageFiltersModel {
  LanguageFiltersModel(this._wordLanguage, this._translationLanguage);
  final Language _wordLanguage;
  final Language _translationLanguage;
  Language get wordLanguage => _wordLanguage;
  Language get translationLanguage => _translationLanguage;
}
