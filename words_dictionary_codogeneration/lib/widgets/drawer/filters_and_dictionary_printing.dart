import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:words_dictionary_codogeneration/widgets/drawer/print_button.dart';
import 'package:words_dictionary_codogeneration/widgets/drawer/translation_language_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/drawer/word_language_drop_down_field.dart';

part 'filters_and_dictionary_printing.g.dart';

@swidget
Widget _filtersAndDictionaryPrinting() {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WordLanguageDropdownField(),
        const Gap(20),
        TranslationLanguageDropdownField(),
        const Gap(20),
        PrintButton(),
      ],
    ),
  );
}
