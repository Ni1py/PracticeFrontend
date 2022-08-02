// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_drop_down_field.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

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

class MyDropDownButton extends ConsumerWidget {
  const MyDropDownButton(this.value, this.onChanged, {Key? key})
      : super(key: key);

  final Language value;

  final void Function(Language) onChanged;

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      myDropDownButton(_context, _ref, value, onChanged);
}
