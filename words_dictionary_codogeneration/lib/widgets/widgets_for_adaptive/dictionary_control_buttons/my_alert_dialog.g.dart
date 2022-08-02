// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_alert_dialog.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class MyAlertDialog extends HookConsumerWidget {
  const MyAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      myAlertDialog(_context, _ref);
}

class TranslationEntryFields extends StatelessWidget {
  const TranslationEntryFields(
      this.wordRu, this.wordEn, this.wordGe, this.wordFr,
      {Key? key})
      : super(key: key);

  final ValueNotifier<String> wordRu;

  final ValueNotifier<String> wordEn;

  final ValueNotifier<String> wordGe;

  final ValueNotifier<String> wordFr;

  @override
  Widget build(BuildContext _context) =>
      translationEntryFields(_context, wordRu, wordEn, wordGe, wordFr);
}
