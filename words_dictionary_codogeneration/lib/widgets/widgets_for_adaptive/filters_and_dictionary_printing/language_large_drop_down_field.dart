import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/styles/style.dart';
import 'package:words_dictionary_codogeneration/styles/text_style_general.dart';

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
        style: textStyleGeneral(
          ref.watch(topicThemeProvider).topicTextColor,
        ),
      ),
      const Gap(24),
      DropdownButton<Language>(
        value: value,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: textStyleGeneral(
          ref.watch(topicThemeProvider).topicButtonColor,
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
