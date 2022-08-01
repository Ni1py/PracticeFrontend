import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/print_button.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/translation_medium_language_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/word_medium_language_drop_down_field.dart';

part 'column_filters_and_dictionary_printing.g.dart';

@swidget
Widget columnFiltersAndDictionaryPrinting(BuildContext context) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WordMediumLanguageDropdownField(),
        const SizedBox(height: 20),
        TranslationMediumLanguageDropdownField(),
        const SizedBox(height: 20),
        PrintButton(),
      ],
    ),
  );
}
