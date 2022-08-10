import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/styles/app_bar_box_decoration.dart';
import 'package:words_dictionary_codogeneration/widgets/drawer/column_filters_and_dictionary_printing.dart';

part 'default_drawer.g.dart';

@cwidget
Widget _defaultDrawer(WidgetRef ref) {
  return Drawer(
    child: Container(
      decoration: appBarBoxDecoration(),
      child: const ColumnFiltersAndDictionaryPrinting(),
    ),
  );
}
