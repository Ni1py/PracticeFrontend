import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/topic_theme.dart';

@immutable
class TopicThemeFiltersModel {
  const TopicThemeFiltersModel(this._topicTheme, this._topicColor,
      this._topicTextColor, this._topicBackgroundColor);
  final TopicTheme _topicTheme;
  final Color _topicColor;
  final Color _topicTextColor;
  final Color _topicBackgroundColor;

  Color get topicColor => _topicColor;
  Color get topicTextColor => _topicTextColor;
  Color get topicBackgroundColor => _topicBackgroundColor;
  TopicTheme get topicTheme => _topicTheme;
}

class TopicThemeFiltersNotifier extends StateNotifier<TopicThemeFiltersModel> {
  TopicThemeFiltersNotifier()
      : super(const TopicThemeFiltersModel(TopicTheme.black, topicColorBlack,
            topicColorWhite, topicColorGrey));

  void topicTheme(TopicTheme theme) {
    if (theme == TopicTheme.black) {
      state = const TopicThemeFiltersModel(
          TopicTheme.black, topicColorBlack, topicColorWhite, topicColorGrey);
    } else {
      state = const TopicThemeFiltersModel(
          TopicTheme.white, topicColorWhite, topicColorBlack, topicColorWhite);
    }
  }
}

final topicThemeProvider =
    StateNotifierProvider<TopicThemeFiltersNotifier, TopicThemeFiltersModel>(
        (_) => TopicThemeFiltersNotifier());
