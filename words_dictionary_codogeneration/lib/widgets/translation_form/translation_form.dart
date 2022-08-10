import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/word_adding_provider.dart';
import 'package:words_dictionary_codogeneration/styles/style.dart';
import 'package:words_dictionary_codogeneration/widgets/translation_form/translation_entry_fields.dart';

part 'translation_form.g.dart';

@hcwidget
Widget _translationForm(BuildContext context, WidgetRef ref) {
  final translations = useState({Language.russian: ''});

  return AlertDialog(
    backgroundColor: ref.watch(topicThemeProvider).topicBackgroundColor,
    titleTextStyle: TextStyle(
      fontSize: fontSize,
      color: ref.watch(topicThemeProvider).topicTextColor,
    ),
    title: Text(topicDialogTitleText.translations[
            ref.watch(topicLanguageFiltersProvider).topicLanguage] ??
        ''),
    content: TranslationEntryFields(translations),
    actions: [
      TextButton(
        child: const Text('OK'),
        onPressed: () => {
          Navigator.pop(context, 'OK'),
          ref.read(wordAddingProvider.notifier).addWord(translations.value),
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
                '',
          ),
        },
      ),
    ],
  );
}
