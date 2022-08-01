import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/column_filters_and_dictionary_printing.dart';

part 'my_drawer.g.dart';

@cwidget
Widget myDrawer(BuildContext context, WidgetRef ref) {
  return Drawer(
    child: Container(
        decoration: BoxDecoration(
            color: ref.watch(topicThemeProvider).topicColor,
            border: Border.all(color: ref.watch(topicThemeProvider).topicTextColor)),
        child: const ColumnFiltersAndDictionaryPrinting()),
  );
}
