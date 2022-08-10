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
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TranslationFormTextField(
        topicInputRuText,
        ((String text) =>
            translations.value.update(Language.russian, (value) => text)),
      ),
      const Gap(20),
      TranslationFormTextField(
        topicInputEnText,
        ((String text) => translations.value[Language.english] = text),
      ),
      const Gap(20),
      TranslationFormTextField(
        topicInputGeText,
        ((String text) => translations.value[Language.german] = text),
      ),
      const Gap(20),
      TranslationFormTextField(
        topicInputFrText,
        ((String text) => translations.value[Language.french] = text),
      ),
    ],
  );
}
