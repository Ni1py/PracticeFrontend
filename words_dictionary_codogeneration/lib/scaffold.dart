import 'package:flutter/material.dart' as material;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary_codogeneration/pages/home_page.dart';
import 'package:words_dictionary_codogeneration/providers/display_mode_provider.dart';
import 'package:words_dictionary_codogeneration/styles/app_bar_box_decoration.dart';
import 'package:words_dictionary_codogeneration/widgets/appbar_drop_down_fieds/topic_color_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/appbar_drop_down_fieds/topic_language_drop_down_field.dart';
import 'package:words_dictionary_codogeneration/widgets/drawer/drawer.dart'
    as drawer;

part 'scaffold.g.dart';

const _drawer = [null, drawer.Drawer()];

@hcwidget
material.Widget _scaffold(WidgetRef ref) {
  final _mode = ref.watch(displayModeProvider);
  final _i = useState(0);

  _mode == DisplayMode.mobile ? _i.value = 1 : _i.value = 0;

  return material.Scaffold(
    drawer: _drawer[_i.value],
    appBar: material.AppBar(
      flexibleSpace: material.Container(
        decoration: appBarBoxDecoration(),
      ),
      title: const material.Text('Words Dictionary'),
      actions: [
        TopicLanguageDropDownField(),
        TopicColorDropDownField(),
      ],
    ),
    body: const HomePage(),
  );
}
