import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/dictionary_control_buttons/column_dictionary_control_buttons.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/dictionary_control_buttons/row_dictionary_control_buttons.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/drawer/my_drawer.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/row_large_filters_and_dictionary_printing.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/row_medium_filters_and_dictionary_printing.dart';

part 'widgets_changer_provider.g.dart';

@immutable
class WidgetsChangerModel {
  const WidgetsChangerModel(
      this._drawer, this._homePageButtonWord, this._homePageDropDownButtons);
  final _drawer;
  final Widget _homePageButtonWord;
  final Widget _homePageDropDownButtons;

  get drawer => _drawer;
  Widget get homePageButtonWord => _homePageButtonWord;
  Widget get homePageDropDownButtons => _homePageDropDownButtons;
}

class WidgetsChangerNotifier extends StateNotifier<WidgetsChangerModel> {
  WidgetsChangerNotifier()
      : super(const WidgetsChangerModel(null, RowDictionaryControlButtons(),
            RowLargeFiltersAndDictionaryPrinting()));

  void changeWidgetsInTree(double width) {
    if (width < 600) {
      state = const WidgetsChangerModel(
          MyDrawer(), ColumnDictionaryControlButtons(), EmptyContainer());
    } else if (width < 1100) {
      state = const WidgetsChangerModel(null, RowDictionaryControlButtons(),
          RowMediumFiltersAndDictionaryPrinting());
    } else {
      state = const WidgetsChangerModel(null, RowDictionaryControlButtons(),
          RowLargeFiltersAndDictionaryPrinting());
    }
  }
}

final widgetsChangerProvider =
    StateNotifierProvider<WidgetsChangerNotifier, WidgetsChangerModel>(
        (_) => WidgetsChangerNotifier());

@swidget
Widget emptyContainer() {
  return Container();
}
