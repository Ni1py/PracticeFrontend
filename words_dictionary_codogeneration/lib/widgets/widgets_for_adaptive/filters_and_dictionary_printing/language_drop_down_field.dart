import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/providers/display_mode_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/styles/text_style_general.dart';

part 'language_drop_down_field.g.dart';

@cwidget
Widget __widgetType(List<Widget> children, WidgetRef ref) {
  final mode = ref.watch(displayModeProvider);
  if (mode == DisplayMode.desktop) {
    return Row(children: children);
  } else if (mode == DisplayMode.tablet) {
    return Column(children: children);
  }

  return SizedBox.shrink();
}

@cwidget
Widget _languageDropdownField(
  WidgetRef ref,
  String label,
  Language value,
  ValueChanged<Language> onChanged,
) {
  final _theme = ref.watch(topicThemeProvider);
  final _language = ref.watch(topicLanguageFiltersProvider).topicLanguages;

  return _WidgetType(
    [
      FittedBox(
        child: Text(label, style: textStyleGeneral(_theme.topicTextColor)),
      ),
      const Gap(24),
      DropdownButton<Language>(
        value: value,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: textStyleGeneral(_theme.topicButtonColor),
        underline: Container(height: 2, color: _theme.topicButtonTextColor),
        onChanged: (Language? newValue) {
          if (newValue != null) {
            onChanged(newValue);
          }
        },
        items: Language.values
            .map((Language value) => DropdownMenuItem<Language>(
                  value: value,
                  child: Text(_language[value.index]),
                ))
            .toList(),
      ),
    ],
    ref,
  );
}
