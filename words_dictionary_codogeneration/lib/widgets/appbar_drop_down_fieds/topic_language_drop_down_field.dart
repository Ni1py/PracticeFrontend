import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/providers/topic_language_filters_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/data_widgets/country_flags.dart';

part 'topic_language_drop_down_field.g.dart';

@cwidget
Widget _topicLanguageDropDownField(WidgetRef ref) {
  return Row(
    children: [
      const SizedBox(width: 24),
      DropdownButton<Language>(
        value: ref.watch(topicLanguageFiltersProvider).topicLanguage,
        elevation: 16,
        underline: const SizedBox(), //DropdownButtonHideUnderline
        onChanged: (Language? newValue) {
          if (newValue != null) {
            ref
                .read(topicLanguageFiltersProvider.notifier)
                .topicLanguage(newValue);
          }
        },
        items: Language.values
            .map((Language value) => DropdownMenuItem<Language>(
                  value: value,
                  child: countryFlags[value.index],
                ))
            .toList(),
      ),
    ],
  );
}
