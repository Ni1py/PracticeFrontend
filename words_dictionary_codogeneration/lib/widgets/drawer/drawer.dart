import 'package:flutter/material.dart' as material;
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/styles/app_bar_box_decoration.dart';
import 'package:words_dictionary_codogeneration/widgets/drawer/filters_and_dictionary_printing.dart';

part 'drawer.g.dart';

@cwidget
material.Widget _drawer(WidgetRef ref) {
  return material.Drawer(
    child: material.DecoratedBox(
      decoration: appBarBoxDecoration(),
      child: const FiltersAndDictionaryPrinting(),
    ),
  );
}
