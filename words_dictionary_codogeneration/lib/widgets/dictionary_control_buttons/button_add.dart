import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/styles/text_style_general.dart';
import 'package:words_dictionary_codogeneration/widgets/translation_form/translation_form.dart';

part 'button_add.g.dart';

@cwidget
Widget _buttonAdd(BuildContext context, WidgetRef ref) {
  final _theme = ref.watch(topicThemeProvider);
  final _language = ref.watch(topicLanguageFiltersProvider).topicLanguage;

  return Center(
    child: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: _theme.topicButtonColor,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const TranslationForm();
            },
          );
        },
        child: Text(
          topicAddButtonText.translations[_language] ?? '',
          style: textStyleGeneral(
            _theme.topicButtonTextColor,
          ),
        ),
      ),
    ),
  );
}
