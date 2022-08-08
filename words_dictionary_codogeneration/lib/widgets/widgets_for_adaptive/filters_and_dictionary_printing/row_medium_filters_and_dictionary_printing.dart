import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/print_button.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/translation_medium_language_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/word_medium_language_drop_down_field.dart';

part 'row_medium_filters_and_dictionary_printing.g.dart';

@swidget
Widget _rowMediumFiltersAndDictionaryPrinting() {
  return Column(
    children: [
      Row(children: [
        Expanded(child: WordMediumLanguageDropdownField()),
        const SizedBox(
          width: 15,
        ),
        Expanded(child: TranslationMediumLanguageDropdownField()),
      ]),
      const SizedBox(
        height: 20,
      ),
      PrintButton(),
    ],
  );
}
