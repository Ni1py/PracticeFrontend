import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';

@immutable
class TopicLanguageFiltersModel {
  const TopicLanguageFiltersModel(this._topicLanguage, this._topicLanguges);
  final Language _topicLanguage;
  final List<String> _topicLanguges;

  Language get topicLanguage => _topicLanguage;
  get topicLanguages => _topicLanguges;
}

class TopicLanguageFiltersNotifier
    extends StateNotifier<TopicLanguageFiltersModel> {
  TopicLanguageFiltersNotifier()
      : super(const TopicLanguageFiltersModel(Language.russian, languageRu));

  void topicLanguage(Language value) {
    List<String> _topicLanguages = [];
    if (value == Language.russian) {
      _topicLanguages = languageRu;
    } else if (value == Language.english) {
      _topicLanguages = languageEn;
    } else if (value == Language.french) {
      _topicLanguages = languageFr;
    } else if (value == Language.german) {
      _topicLanguages = languageGe;
    }

    state = TopicLanguageFiltersModel(value, _topicLanguages);
  }
}

final topicLanguageFiltersProvider = StateNotifierProvider<
    TopicLanguageFiltersNotifier,
    TopicLanguageFiltersModel>((_) => TopicLanguageFiltersNotifier());
