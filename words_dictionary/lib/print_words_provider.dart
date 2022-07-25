import 'package:flutter/widgets.dart';
import 'package:words_dictionary/data/language.dart';
import 'package:words_dictionary/data/words_service.dart' as words_service;
import 'package:words_dictionary/language_filters_provider.dart';


class PrintWordsProvider extends StatefulWidget {
  const PrintWordsProvider({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => PrintWordsProviderState();
}

class PrintWordsProviderState extends State<PrintWordsProvider> {
  final model = PrintWordsProviderModel();

  @override
  void didChangeDependencies() {
    final filters = LanguageFiltersInheritedNotifier.of(context);
    filters.addListener(() {
      model.wordLanguage = filters.wordLanguage;
      model.translationLanguage = filters.translationLanguage;
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PrintWordsInheritedNotifier(
        notifier: model,
        child: widget.child,
      );
}

class PrintWordsProviderModel extends ChangeNotifier {
  var wordLanguage = Language.russian;
  var translationLanguage = Language.english;

  final _wordIds = <int>{};
  Set<int> get wordIds => _wordIds;

  void printWords() {
    final result = words_service
        .getWords()
        .where((word) => _wordIds.contains(word.id))
        .map((word) {
      final translations = word.translations;

      return '${translations[wordLanguage]} - ${translations[translationLanguage]}';
    }).join("\n\r");

    // ignore: avoid_print
    print(result);
  }

  void addWord(int wordId) {
    if (!_wordIds.contains(wordId)) {
      _wordIds.add(wordId);
      notifyListeners();
    }
  }

  void removeWord(int wordId) {
    if (_wordIds.contains(wordId)) {
      _wordIds.remove(wordId);
      notifyListeners();
    }
  }
}

class PrintWordsInheritedNotifier
    extends InheritedNotifier<PrintWordsProviderModel> {
  const PrintWordsInheritedNotifier({
    Key? key,
    required PrintWordsProviderModel notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static PrintWordsProviderModel of(BuildContext context) {
    final PrintWordsInheritedNotifier? result = context
        .dependOnInheritedWidgetOfExactType<PrintWordsInheritedNotifier>();
    if (result == null) {
      throw Exception('No PrintWordsInheritedNotifier found in context');
    }

    final model = result.notifier;
    if (model == null) {
      throw Exception('PrintWordsProviderModel is null');
    }

    return model;
  }
}
