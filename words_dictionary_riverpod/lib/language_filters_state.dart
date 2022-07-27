import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:words_dictionary_riverpod/data/language.dart';

// class LanguageFiltersProvider extends StatefulWidget {
//   const LanguageFiltersProvider({Key? key, required this.child})
//       : super(key: key);

//   final Widget child;

//   @override
//   State<StatefulWidget> createState() => LanguageFiltersProviderState();
// }

// class LanguageFiltersProviderState extends State<LanguageFiltersProvider> {
//   final model = LanguageFiltersModel();

//   @override
//   void dispose() {
//     model.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => LanguageFiltersInheritedNotifier(
//         notifier: model,
//         child: widget.child,
//       );
// }

// class LanguageFiltersModel extends ChangeNotifier {
//   Language _wordLanguage = Language.russian;
//   Language get wordLanguage => _wordLanguage;
//   set wordLanguage(Language value) {
//     _wordLanguage = value;
//     notifyListeners();
//   }

//   Language _translationLanguage = Language.english;
//   Language get translationLanguage => _translationLanguage;
//   set translationLanguage(Language value) {
//     _translationLanguage = value;
//     notifyListeners();
//   }
// }

// class LanguageFiltersInheritedNotifier
//     extends InheritedNotifier<LanguageFiltersModel> {
//   const LanguageFiltersInheritedNotifier({
//     Key? key,
//     required LanguageFiltersModel notifier,
//     required Widget child,
//   }) : super(key: key, notifier: notifier, child: child);

//   static LanguageFiltersModel of(BuildContext context) {
//     final LanguageFiltersInheritedNotifier? result = context
//         .dependOnInheritedWidgetOfExactType<LanguageFiltersInheritedNotifier>();
//     if (result == null) {
//       throw Exception('No LanguageFiltersInheritedNotifier found in context');
//     }

//     final model = result.notifier;
//     if (model == null) {
//       throw Exception('LanguageFiltersModel is null');
//     }

//     return model;
//   }
// }

final languageFiltersProvider = StateProvider<LanguageFiltersModel>((_) {
  return LanguageFiltersModel(Language.russian, Language.english);
});

class LanguageFiltersModel {
  LanguageFiltersModel(this._wordLanguage, this._translationLanguage);
  Language _wordLanguage; //= Language.russian;
  Language get wordLanguage => _wordLanguage;
  set wordLanguage(Language value) {
    _wordLanguage = value;
    //notifyListeners();
  }

  Language _translationLanguage; //= Language.english;
  Language get translationLanguage => _translationLanguage;
  set translationLanguage(Language value) {
    _translationLanguage = value;
    //notifyListeners();
  }
}