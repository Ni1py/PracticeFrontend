import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/data/topic_text_service.dart';
import 'package:words_dictionary_codogeneration/widgets/translation_form/translation_form_text_field.dart';

part 'translation_entry_fields.g.dart';

@swidget
Widget _translationEntryFields(
  ValueNotifier<Map<Language, String>> translations,
) {
  Function(String)? addWord(Language language) {
    return ((String text) => translations.value[language] = text);
  }

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TranslationFormTextField(topicInputRuText, addWord(Language.russian)),
      const Gap(20),
      TranslationFormTextField(topicInputEnText, addWord(Language.english)),
      const Gap(20),
      TranslationFormTextField(topicInputGeText, addWord(Language.german)),
      const Gap(20),
      TranslationFormTextField(topicInputFrText, addWord(Language.french)),
    ],
  );
}
