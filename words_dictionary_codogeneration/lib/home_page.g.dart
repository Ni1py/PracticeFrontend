// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => homePage(_context);
}

class MyAlertDialog extends HookConsumerWidget {
  const MyAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      myAlertDialog(_context, _ref);
}

class ButtonAdd extends ConsumerWidget {
  const ButtonAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      buttonAdd(_context, _ref);
}

class ButtonDelete extends ConsumerWidget {
  const ButtonDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      buttonDelete(_context, _ref);
}

class AlertDialogTextField extends ConsumerWidget {
  const AlertDialogTextField(this.hintContent, this.onChanged, {Key? key})
      : super(key: key);

  final TopicText hintContent;

  final dynamic Function(String)? onChanged;

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      alertDialogTextField(_context, _ref, hintContent, onChanged);
}

class ContainerBackground extends ConsumerWidget {
  const ContainerBackground(this.child, {Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      containerBackground(_context, _ref, child);
}

class TopicColorDropDownField extends ConsumerWidget {
  const TopicColorDropDownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      topicColorDropDownField(_context, _ref);
}

class TopicLanguageDropDownField extends ConsumerWidget {
  const TopicLanguageDropDownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      topicLanguageDropDownField(_context, _ref);
}

class PrintButton extends ConsumerWidget {
  const PrintButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      printButton(_context, _ref);
}

class WordLanguageDropdownField extends ConsumerWidget {
  const WordLanguageDropdownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      wordLanguageDropdownField(_context, _ref);
}

class TranslationLanguageDropdownField extends ConsumerWidget {
  const TranslationLanguageDropdownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      translationLanguageDropdownField(_context, _ref);
}

class LanguageDropdownField extends ConsumerWidget {
  const LanguageDropdownField(this.label, this.value, this.onChanged,
      {Key? key})
      : super(key: key);

  final String label;

  final Language value;

  final void Function(Language) onChanged;

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      languageDropdownField(_context, _ref, label, value, onChanged);
}
