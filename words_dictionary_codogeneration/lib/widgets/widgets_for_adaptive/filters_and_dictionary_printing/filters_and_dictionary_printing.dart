import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:words_dictionary_codogeneration/providers/display_mode_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/print_button.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/translation_language_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/word_language_drop_down_field.dart';

part 'filters_and_dictionary_printing.g.dart';

@cwidget
Widget _filtersAndDictionaryPrinting(WidgetRef ref) {
  final _mode = ref.watch(displayModeProvider);
  if (_mode == DisplayMode.desktop) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WordLanguageDropdownField(),
        TranslationLanguageDropdownField(),
        PrintButton(),
      ],
    );
  } else if (_mode == DisplayMode.tablet) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Expanded(child: WordLanguageDropdownField()),
          Expanded(child: TranslationLanguageDropdownField()),
        ]),
        const Gap(20),
        PrintButton(),
      ],
    );
  }

  return SizedBox.shrink();
}
