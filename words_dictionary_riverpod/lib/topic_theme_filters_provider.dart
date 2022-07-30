import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/topic_theme.dart';

// class TopicThemeFiltersModel {
//   TopicTheme _topicTheme = TopicTheme.black;
//   Color _topicColor = topicColorBlack;
//   Color _topicTextColor = topicColorWhite;
//   Color _topicBackgroundColor = topicColorGrey;

//   Color get topicColor => _topicColor;
//   Color get topicTextColor => _topicTextColor;
//   Color get topicBackgroundColor => _topicBackgroundColor;
//   TopicTheme get topicTheme => _topicTheme;
// }

// class TopicThemeFitersNotifier extends StateNotifier<TopicThemeFiltersModel> {
//   TopicThemeFitersNotifier() : super(TopicThemeFiltersModel());

//   set topicTheme(TopicTheme value) {
//     state._topicTheme = value;
//     if (value == TopicTheme.black) {
//       state._topicColor = topicColorBlack;
//       state._topicBackgroundColor = topicColorGrey;
//       state._topicTextColor = topicColorWhite;
//     } else if (value == TopicTheme.white) {
//       state._topicColor = topicColorWhite;
//       state._topicBackgroundColor = topicColorWhite;
//       state._topicTextColor = topicColorBlack;
//     }
//   }
// }

// final topicThemeProvider = StateNotifierProvider<TopicThemeFitersNotifier, TopicThemeFiltersModel>((_) {
//   return TopicThemeFitersNotifier();
// });

class TopicThemeFiltersModel {
  TopicThemeFiltersModel(this._topicTheme, this._topicColor,
      this._topicTextColor, this._topicBackgroundColor);
  TopicTheme _topicTheme;
  Color _topicColor;
  Color _topicTextColor;
  Color _topicBackgroundColor;

  Color get topicColor => _topicColor;
  Color get topicTextColor => _topicTextColor;
  Color get topicBackgroundColor => _topicBackgroundColor;
  TopicTheme get topicTheme => _topicTheme;
  set topicTheme(TopicTheme value) => _topicTheme = value;
  set topicColor(Color color) => _topicColor = color;
  set topicBackgroundColor(Color color) => _topicBackgroundColor = color;
  set topicTextColor(Color color) => _topicTextColor = color;
}

final topicThemeProvider = StateProvider<TopicThemeFiltersModel>((_) =>
    TopicThemeFiltersModel(
        TopicTheme.black, topicColorBlack, topicColorWhite, topicColorGrey));
