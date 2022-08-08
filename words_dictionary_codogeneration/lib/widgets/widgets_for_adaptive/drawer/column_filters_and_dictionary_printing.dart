import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/drawer/print_button.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/drawer/translation_language_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/drawer/word_language_drop_down_field.dart';

part 'column_filters_and_dictionary_printing.g.dart';

@swidget
Widget _columnFiltersAndDictionaryPrinting() {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WordLanguageDropdownField(),
        const SizedBox(height: 20),
        TranslationLanguageDropdownField(),
        const SizedBox(height: 20),
        PrintButton(),
      ],
    ),
  );
}
