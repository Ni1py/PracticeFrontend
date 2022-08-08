import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/styles/style.dart';

part 'language_large_drop_down_field.g.dart';

@cwidget
Widget _languageLargeDropdownField(
  WidgetRef ref,
  String label,
  Language value,
  ValueChanged<Language> onChanged,
) {
  return Row(
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          color: ref.watch(topicThemeProvider).topicTextColor,
        ),
      ),
      const SizedBox(width: 24),
      DropdownButton<Language>(
        value: value,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: TextStyle(
          color: ref.watch(topicThemeProvider).topicButtonColor,
          fontSize: fontSize,
        ),
        underline: Container(
          height: 2,
          color: ref.watch(topicThemeProvider).topicButtonTextColor,
        ),
        onChanged: (Language? newValue) {
          if (newValue != null) {
            onChanged(newValue);
          }
        },
        items: Language.values
            .map((Language value) => DropdownMenuItem<Language>(
                  value: value,
                  child: Text(ref
                      .watch(topicLanguageFiltersProvider)
                      .topicLanguages[value.index]),
                ))
            .toList(),
      ),
    ],
  );
}
