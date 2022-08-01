import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/word_adding_provider.dart';
import 'package:words_dictionary_codogeneration/styles/style.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/dictionary_control_buttons/alert_dialog_text_field.dart';

part 'my_alert_dialog.g.dart';

@hcwidget
Widget myAlertDialog(BuildContext context, WidgetRef ref) {
  final wordRu = useState('');
  final wordEn = useState('');
  final wordGe = useState('');
  final wordFr = useState('');

  return AlertDialog(
    backgroundColor: ref.watch(topicThemeProvider).topicBackgroundColor,
    titleTextStyle: TextStyle(
        fontSize: fontSize,
        color: ref.watch(topicThemeProvider).topicTextColor),
    title: Text(topicDialogTitleText.translations[
            ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
        ''),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AlertDialogTextField(
            topicInputRuText, ((String text) => wordRu.value = text)),
        const SizedBox(
          height: 20,
        ),
        AlertDialogTextField(
            topicInputEnText, ((String text) => wordEn.value = text)),
        const SizedBox(
          height: 20,
        ),
        AlertDialogTextField(
            topicInputGeText, ((String text) => wordGe.value = text)),
        const SizedBox(
          height: 20,
        ),
        AlertDialogTextField(
            topicInputFrText, ((String text) => wordFr.value = text)),
      ],
    ),
    actions: [
      TextButton(
        child: const Text('OK'),
        onPressed: () => {
          Navigator.pop(context, 'OK'),
          ref
              .read(wordAddingProvider.notifier)
              .addWord(wordRu.value, wordEn.value, wordGe.value, wordFr.value),
        },
      ),
      TextButton(
        child: Text(topicCancelButtonText.translations[
                ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
            ''),
        onPressed: () => {
          Navigator.pop(
              context,
              topicCancelButtonText.translations[
                      ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
                  ''),
        },
      ),
    ],
  );
}