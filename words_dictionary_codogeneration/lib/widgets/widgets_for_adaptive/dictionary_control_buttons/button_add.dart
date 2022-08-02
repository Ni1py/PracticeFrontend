import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/styles/style.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/dictionary_control_buttons/my_alert_dialog.dart';

part 'button_add.g.dart';

@cwidget
Widget buttonAdd(BuildContext context, WidgetRef ref) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ref.watch(topicThemeProvider).topicButtonColor,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const MyAlertDialog();
          },
        );
      },
      child: Text(
        topicAddButtonText.translations[
                ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
            '',
        style: TextStyle(
          fontSize: fontSize,
          color: ref.watch(topicThemeProvider).topicButtonTextColor,
        ),
      ),
    ),
  );
}
