import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/styles/style.dart';

part 'language_drop_down_field.g.dart';

@cwidget
Widget languageDropdownField(
  BuildContext context,
  WidgetRef ref,
  String label,
  Language value,
  ValueChanged<Language> onChanged,
) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          Color.fromARGB(255, 172, 34, 147),
          Color.fromARGB(255, 12, 184, 87),
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      children: [
        FittedBox(
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              color: ref.watch(topicThemeProvider).topicTextColor,
            ),
          ),
        ),
        const SizedBox(width: 24),
        MyDropDownButton(value, onChanged),
      ],
    ),
  );
}

@cwidget
Widget myDropDownButton(
  BuildContext context,
  WidgetRef ref,
  Language value,
  ValueChanged<Language> onChanged,
) {
  return DropdownButton<Language>(
    value: value,
    icon: const Icon(Icons.arrow_downward),
    elevation: 16,
    style: const TextStyle(
      color: Color.fromARGB(255, 59, 200, 181),
      fontSize: fontSize,
    ),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
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
  );
}
