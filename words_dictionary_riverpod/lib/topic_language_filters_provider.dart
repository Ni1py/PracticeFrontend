import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/language.dart';

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
    final topicLanguage = value;
    List<String> topicLanguages = [];
    if (value == Language.russian) {
      topicLanguages = languageRu;
    } else if (value == Language.english) {
      topicLanguages = languageEn;
    } else if (value == Language.french) {
      topicLanguages = languageFr;
    } else if (value == Language.german) {
      topicLanguages = languageGe;
    }

    state = TopicLanguageFiltersModel(topicLanguage, topicLanguages);
  }
}

final topicLanguageFiltersProvider = StateNotifierProvider<
    TopicLanguageFiltersNotifier,
    TopicLanguageFiltersModel>((_) => TopicLanguageFiltersNotifier());
