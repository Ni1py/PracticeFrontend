// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_drop_down_field.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class _WidgetType extends ConsumerWidget {
  const _WidgetType(this.children, this.ref, {Key? key}) : super(key: key);

  final List<Widget> children;

  final WidgetRef ref;

  @override
  Widget build(BuildContext _context, WidgetRef _ref) =>
      __widgetType(children, ref);
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
      _languageDropdownField(_ref, label, value, onChanged);
}
