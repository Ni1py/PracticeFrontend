import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/topic_theme.dart';

@immutable
class TopicThemeFiltersModel {
  const TopicThemeFiltersModel(
      this._topicTheme,
      this._topicColor,
      this._topicTextColor,
      this._topicBackgroundColor,
      this._topicButtonColor,
      this._topicButtonTextColor);
  final TopicTheme _topicTheme;
  final Color _topicColor;
  final Color _topicTextColor;
  final Color _topicBackgroundColor;
  final Color _topicButtonColor;
  final Color _topicButtonTextColor;

  Color get topicColor => _topicColor;
  Color get topicTextColor => _topicTextColor;
  Color get topicBackgroundColor => _topicBackgroundColor;
  Color get topicButtonColor => _topicButtonColor;
  Color get topicButtonTextColor => _topicButtonTextColor;
  TopicTheme get topicTheme => _topicTheme;
}

class TopicThemeFiltersNotifier extends StateNotifier<TopicThemeFiltersModel> {
  TopicThemeFiltersNotifier()
      : super(const TopicThemeFiltersModel(TopicTheme.black, ColorBlack,
            ColorWhite, ColorGrey, ColorLettuce, ColorPurple));

  void topicTheme(TopicTheme theme) {
    if (theme == TopicTheme.black) {
      state = const TopicThemeFiltersModel(
          TopicTheme.black, ColorBlack, ColorWhite, ColorGrey, ColorLettuce, ColorPurple);
    } else {
      state = const TopicThemeFiltersModel(
          TopicTheme.white, ColorWhite, ColorBlack, ColorWhite, ColorPurple, ColorLettuce);
    }
  }
}

final topicThemeProvider =
    StateNotifierProvider<TopicThemeFiltersNotifier, TopicThemeFiltersModel>(
        (_) => TopicThemeFiltersNotifier());
