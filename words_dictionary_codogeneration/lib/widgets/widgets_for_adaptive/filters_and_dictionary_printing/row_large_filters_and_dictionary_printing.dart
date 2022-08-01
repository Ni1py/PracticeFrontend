import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/print_button.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/translation_large_language_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/word_large_language_drop_down_field.dart';

part 'row_large_filters_and_dictionary_printing.g.dart';

@swidget
Widget rowLargeFiltersAndDictionaryPrinting(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      WordLargeLanguageDropdownField(),
      TranslationLargeLanguageDropdownField(),
      PrintButton(),
    ],
  );
}
