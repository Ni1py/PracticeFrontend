import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/providers/display_mode_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/default_home_page.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/dictionary_control_buttons/row_dictionary_control_buttons.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/row_large_filters_and_dictionary_printing.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/row_medium_filters_and_dictionary_printing.dart';

part 'adaptive_home_page.g.dart';

@swidget
Widget _adaptiveHomePage(BuildContext context) {
  switch (DisplayModeProvider.of(context)) {
    case DisplayMode.desktop:
      return DefaultHomePage(
        RowDictionaryControlButtons(),
        RowLargeFiltersAndDictionaryPrinting(),
      );
    case DisplayMode.tablet:
      return DefaultHomePage(
        RowDictionaryControlButtons(),
        RowMediumFiltersAndDictionaryPrinting(),
      );
    case DisplayMode.mobile:
      return DefaultHomePage(
        RowDictionaryControlButtons(),
        Container(),
      );
  }
}
