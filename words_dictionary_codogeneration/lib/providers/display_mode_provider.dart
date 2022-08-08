import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'display_mode_provider.g.dart';

enum DisplayMode {
  mobile,
  tablet,
  desktop,
}

@hwidget
Widget _displayModeScope({required Widget child}) {
  final width = MediaQuery.of(useContext()).size.width;

  return DisplayModeProvider(
    displayWidth: width,
    child: child,
  );
}

class DisplayModeProvider extends InheritedWidget {
  const DisplayModeProvider({
    Key? key,
    required Widget child,
    required this.displayWidth,
  }) : super(key: key, child: child);

  final double displayWidth;

  DisplayMode get mode {
    if (displayWidth < 600) {
      return DisplayMode.mobile;
    } else if (displayWidth < 1100) {
      return DisplayMode.tablet;
    } else {
      return DisplayMode.desktop;
    }
  }

  @override
  bool updateShouldNotify(DisplayModeProvider oldWidget) =>
      mode != oldWidget.mode;

  static DisplayMode of(BuildContext context) {
    final DisplayModeProvider? result =
        context.dependOnInheritedWidgetOfExactType<DisplayModeProvider>();
    if (result == null) {
      throw Exception('No DisplayModeProvider found in context');
    }

    return result.mode;
  }
}
