import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DisplayMode {
  mobile,
  tablet,
  desktop,
}

class DisplayModeStateNotifier extends StateNotifier<DisplayMode>
    with WidgetsBindingObserver {
  DisplayModeStateNotifier() : super(DisplayMode.desktop) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    final _displayWidth = WidgetsBinding.instance.window.physicalSize.width;

    if (_displayWidth < 600) {
      state = DisplayMode.mobile;
    } else if (_displayWidth < 1100) {
      state = DisplayMode.tablet;
    } else {
      state = DisplayMode.desktop;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

final displayModeProvider =
    StateNotifierProvider<DisplayModeStateNotifier, DisplayMode>(
  (_) => DisplayModeStateNotifier(),
);
