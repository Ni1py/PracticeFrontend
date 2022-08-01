import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/providers/widgets_changer_provider.dart';
import 'package:words_dictionary_codogeneration/widgets/word_list/words_list.dart';

part 'home_page.g.dart';

@cwidget
Widget homePage(BuildContext context, WidgetRef ref) {
  return ContainerBackground(
    Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 56,
          ),
          ref.watch(widgetsChangerProvider).homePageButtonWord,
          const SizedBox(
            height: 20,
          ),
          ref.watch(widgetsChangerProvider).homePageDropDownButtons,
          const SizedBox(
            height: 56,
          ),
          const WordsList(),
        ],
      ),
    ),
  );
}

@cwidget
Widget containerBackground(BuildContext context, WidgetRef ref, Widget child) {
  return Container(
    color: ref.watch(topicThemeProvider).topicColor,
    child: child,
  );
}
