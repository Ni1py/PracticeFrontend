import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/data/language.dart';
import 'package:words_dictionary_codogeneration/providers/topic_theme_filters_provider.dart';
import 'package:words_dictionary_codogeneration/styles/drawer_box_decoration.dart';
import 'package:words_dictionary_codogeneration/styles/text_style_general.dart';
import 'package:words_dictionary_codogeneration/widgets/drawer/drawer_drop_down_button.dart';

part 'language_drop_down_field.g.dart';

@cwidget
Widget _languageDropdownField(
  WidgetRef ref,
  String label,
  Language value,
  ValueChanged<Language> onChanged,
) {
  return Container(
    decoration: drawerBoxDecoration(),
    child: Column(
      children: [
        FittedBox(
          child: Text(
            label,
            style: textStyleGeneral(
              ref.watch(topicThemeProvider).topicTextColor,
            ),
          ),
        ),
        const Gap(24),
        DrawerDropDownButton(value, onChanged),
      ],
    ),
  );
}
