import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/styles/text_style_general.dart';

part 'drawer_drop_down_button.g.dart';

@cwidget
Widget _drawerDropDownButton(
  WidgetRef ref,
  Language value,
  ValueChanged<Language> onChanged,
) {
  return DropdownButton<Language>(
    value: value,
    icon: const Icon(Icons.arrow_downward),
    elevation: 16,
    style: textStyleGeneral(
      Color.fromARGB(255, 59, 200, 181),
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
