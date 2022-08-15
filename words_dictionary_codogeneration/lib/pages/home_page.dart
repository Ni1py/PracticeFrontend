import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/dictionary_control_buttons/button_add.dart';
import 'package:words_dictionary_codogeneration/widgets/widgets_for_adaptive/filters_and_dictionary_printing/filters_and_dictionary_printing.dart';
import 'package:words_dictionary_codogeneration/widgets/word_list/words_list.dart';

part 'home_page.g.dart';

@hcwidget
Widget _homePage(WidgetRef ref) {
  return _ContainerBackground(
    Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          const Gap(56),
          ButtonAdd(),
          const Gap(20),
          FiltersAndDictionaryPrinting(),
          const Gap(56),
          const WordsList(),
        ],
      ),
    ),
  );
}

@cwidget
Widget __containerBackground(WidgetRef ref, Widget child) {
  final _theme = ref.watch(topicThemeProvider).topicColor;

  return DecoratedBox(
    decoration: BoxDecoration(color: _theme),
    child: child,
  );
}
