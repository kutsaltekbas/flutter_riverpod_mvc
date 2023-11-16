import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/dark/app_theme_dark.dart';
import '../theme/light/app_theme_light.dart';

final themeProvider =
    NotifierProvider<ThemeNotifier, ThemeSettings>(ThemeNotifier.new);

class ThemeNotifier extends Notifier<ThemeSettings> {
  @override
  ThemeSettings build() {
    return ThemeSettings(
        mode: ThemeMode.light,
        themeData: AppThemeLight.instance.theme,
        primaryColor: Colors.blue);
  }

  // ignore: avoid_public_notifier_properties
  ThemeData get theme => super.ref.read(themeProvider).themeData;

  void toggle() {
    state = state.mode.toggle == ThemeMode.light
        ? state.copyWith(
            mode: ThemeMode.light, themeData: AppThemeLight.instance.theme)
        : state.copyWith(
            mode: ThemeMode.dark, themeData: AppThemeDark.instance.theme);
  }

  void setPrimaryColor(Color color) {
    state = state.copyWith(primaryColor: color);
  }
}

class ThemeSettings {
  ThemeSettings({
    required this.mode,
    required this.themeData,
    required this.primaryColor,
  });

  final ThemeMode mode;
  final ThemeData themeData;
  final Color primaryColor;

  ThemeSettings copyWith({
    ThemeMode? mode,
    ThemeData? themeData,
    Color? primaryColor,
  }) {
    return ThemeSettings(
      mode: mode ?? this.mode,
      themeData: themeData ?? this.themeData,
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }
}

extension ToggleTheme on ThemeMode {
  ThemeMode get toggle {
    switch (this) {
      case ThemeMode.dark:
        return ThemeMode.light;
      case ThemeMode.light:
        return ThemeMode.dark;
      case ThemeMode.system:
        return ThemeMode.system;
    }
  }
}
