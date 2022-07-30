import 'package:flutter/material.dart';
import 'package:words_dictionary_riverpod/data/language.dart';
import 'package:words_dictionary_riverpod/data/word.dart';
import 'package:words_dictionary_riverpod/data/words_service.dart';

class WordAddingProvider extends StatefulWidget {
  const WordAddingProvider({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => _WordAddingProviderState();
}

class _WordAddingProviderState extends State<WordAddingProvider> {
  final model = WordAddingModel();

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WordAddingInheritedNotifier(
        notifier: model,
        child: widget.child,
      );
}

class WordAddingModel extends ChangeNotifier {
  final _words = getWords();
  get words => _words;
  String _wordRu = '';
  String _wordEn = '';
  String _wordGe = '';
  String _wordFr = '';

  set wordRu(String value) {
    _wordRu = value;
  }

  set wordEn(String value) {
    _wordEn = value;
  }

  set wordGe(String value) {
    _wordGe = value;
  }

  set wordFr(String value) {
    _wordFr = value;
  }

  void clear() {
    _wordRu = '';
    _wordEn = '';
    _wordGe = '';
    _wordFr = '';
    notifyListeners();
  }

  void addWord() {
    if (_wordRu != '' && _wordEn != '' && _wordGe != '' && _wordFr != '') {
      _words.add(Word(
        translations: {
          Language.russian: _wordRu,
          Language.english: _wordEn,
          Language.german: _wordGe,
          Language.french: _wordFr,
        },
        id: _words.length + 1,
      ));
      notifyListeners();
    }
  }

  void deleteWord() {
    _words.removeLast();
    notifyListeners();
  }
}

class WordAddingInheritedNotifier extends InheritedNotifier<WordAddingModel> {
  const WordAddingInheritedNotifier({
    Key? key,
    required WordAddingModel notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static WordAddingModel of(BuildContext context) {
    final WordAddingInheritedNotifier? result = context
        .dependOnInheritedWidgetOfExactType<WordAddingInheritedNotifier>();
    if (result == null) {
      throw Exception('No WordAddingInheritedNotifier found in context');
    }

    final model = result.notifier;
    if (model == null) {
      throw Exception('WordAddingModel is null');
    }

    return model;
  }
}
