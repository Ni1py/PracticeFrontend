import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/drawer/column_filters_and_dictionary_printing.dart';

part 'my_drawer.g.dart';

@cwidget
Widget myDrawer(BuildContext context, WidgetRef ref) {
  return Drawer(
    child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Color.fromARGB(255, 138, 10, 161),
              Color.fromARGB(255, 12, 184, 87)
            ])),
        child: const ColumnFiltersAndDictionaryPrinting()),
  );
}
