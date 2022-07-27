import 'package:flutter/material.dart';
import 'package:words_dictionary_riverpod/data/language.dart';

class TopicLanguageFiltersProvider extends StatefulWidget {
  const TopicLanguageFiltersProvider({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => _TopicLanguageFiltersProviderState();
}

class _TopicLanguageFiltersProviderState extends State<TopicLanguageFiltersProvider> {
  final model = TopicLanguageFiltersModel();

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TopicLanguageFiltersInheritedNotifier(
        notifier: model,
        child: widget.child,
      );
}

class TopicLanguageFiltersModel extends ChangeNotifier {
  Language _topicLanguage = Language.russian;
  var _topicLanguges = languageRu;

  Language get topicLanguage => _topicLanguage;
  get topicLanguages => _topicLanguges;
  set topicLanguage(Language value) {
    _topicLanguage = value;
    if (value == Language.russian) {
      _topicLanguges = languageRu;
    } else if (value == Language.english) {
      _topicLanguges = languageEn;
    } else if (value == Language.french) {
      _topicLanguges = languageFr;
    } else if (value == Language.german) {
      _topicLanguges = languageGe;
    }
    notifyListeners();
  }
}

class TopicLanguageFiltersInheritedNotifier
    extends InheritedNotifier<TopicLanguageFiltersModel> {
  const TopicLanguageFiltersInheritedNotifier({
    Key? key,
    required TopicLanguageFiltersModel notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static TopicLanguageFiltersModel of(BuildContext context) {
    final TopicLanguageFiltersInheritedNotifier? result = context
        .dependOnInheritedWidgetOfExactType<TopicLanguageFiltersInheritedNotifier>();
    if (result == null) {
      throw Exception('No TopicLanguageFiltersInheritedNotifier found in context');
    }

    final model = result.notifier;
    if (model == null) {
      throw Exception('TopicLanguageFiltersModel is null');
    }

    return model;
  }
}
