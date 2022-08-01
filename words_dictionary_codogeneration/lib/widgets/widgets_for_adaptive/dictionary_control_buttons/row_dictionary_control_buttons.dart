import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/dictionary_control_buttons/button_add.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/dictionary_control_buttons/button_delete.dart';

part 'row_dictionary_control_buttons.g.dart';

@swidget
Widget rowDictionaryControlButtons() {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    ButtonAdd(),
    ButtonDelete(),
  ]);
}
