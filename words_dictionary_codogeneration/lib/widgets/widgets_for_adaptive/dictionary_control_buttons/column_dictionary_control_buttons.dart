import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/dictionary_control_buttons/button_add_small.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/dictionary_control_buttons/button_delete_small.dart';

part 'column_dictionary_control_buttons.g.dart';

@swidget
Widget columnDictionaryControlButtons() {
  return Column(children: [
    ButtonAddSmall(),
    ButtonDeleteSmall(),
  ]);
}
