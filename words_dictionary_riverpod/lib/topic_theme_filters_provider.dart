import 'package:flutter/material.dart';
import 'package:words_dictionary_riverpod/data/topic_theme.dart';

class TopicThemeFiltersProvider extends StatefulWidget {
  const TopicThemeFiltersProvider({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => _TopicThemeFiltersProviderState();
}

class _TopicThemeFiltersProviderState extends State<TopicThemeFiltersProvider> {
  final model = TopicThemeFiltersModel();

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TopicThemeFiltersInheritedNotifier(
        notifier: model,
        child: widget.child,
      );
}

class TopicThemeFiltersModel extends ChangeNotifier {
  TopicTheme _topicTheme = TopicTheme.black;
  Color _topicColor = topicColorBlack;
  Color _topicTextColor = topicColorWhite;
  Color _topicBackgroundColor = topicColorGrey;

  Color get topicColor => _topicColor;
  Color get topicTextColor => _topicTextColor;
  Color get topicBackgroundColor => _topicBackgroundColor;
  TopicTheme get topicTheme => _topicTheme;
  set topicTheme(TopicTheme value) {
    _topicTheme = value;
    if (value == TopicTheme.black) {
      _topicColor = topicColorBlack;
      _topicBackgroundColor = topicColorGrey;
      _topicTextColor = topicColorWhite;
    }
    else if (value == TopicTheme.white) {
      _topicColor = topicColorWhite;
      _topicBackgroundColor = topicColorWhite;
      _topicTextColor = topicColorBlack;
    }
    notifyListeners();
  }
}

class TopicThemeFiltersInheritedNotifier
    extends InheritedNotifier<TopicThemeFiltersModel> {
  const TopicThemeFiltersInheritedNotifier({
    Key? key,
    required TopicThemeFiltersModel notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static TopicThemeFiltersModel of(BuildContext context) {
    final TopicThemeFiltersInheritedNotifier? result = context
        .dependOnInheritedWidgetOfExactType<TopicThemeFiltersInheritedNotifier>();
    if (result == null) {
      throw Exception('No TopicThemeFiltersInheritedNotifier found in context');
    }

    final model = result.notifier;
    if (model == null) {
      throw Exception('TopicThemeFiltersModel is null');
    }

    return model;
  }
}
