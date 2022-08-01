import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary_codogeneration/data/topic_color_containers.dart';
import 'package:words_dictionary_codogeneration/data/topic_theme.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';

part 'topic_color_drop_down_field.g.dart';

@cwidget
Widget topicColorDropDownField(BuildContext context, WidgetRef ref) {
  return Row(
    children: [
      const SizedBox(width: 24),
      DropdownButton<TopicTheme>(
        value: ref.watch(topicThemeProvider).topicTheme,
        elevation: 16,
        underline: const SizedBox(), //DropdownButtonHideUnderline
        onChanged: (TopicTheme? newValue) {
          if (newValue != null) {
            ref.read(topicThemeProvider.notifier).topicTheme(newValue);
          }
        },
        items: TopicTheme.values
            .map((TopicTheme value) => DropdownMenuItem<TopicTheme>(
                  value: value,
                  child: topicColorContainers[value.index],
                ))
            .toList(),
      ),
    ],
  );
}
