import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeDark {
  static AppThemeDark? _instance;
  static AppThemeDark get instance => _instance ??= AppThemeDark._init();

  AppThemeDark._init();

  ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: _colorSchemeLight,
        textTheme: _textThemeLight,
        scaffoldBackgroundColor: _colorSchemeLight.background,
        appBarTheme: _appBarTheme,
        inputDecorationTheme: _inputDecorationTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        timePickerTheme: _timePickerTheme,
      );
  /* Color Palette For The App. */

  ColorScheme get _colorSchemeLight => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xffab79d3), //
        primaryContainer: Color(0xffaabb54), //
        secondary: Color(0xffE7122D), //
        onSecondary: Color(0xffffffff),
        onPrimary: Color(0xffffffff), //
        background: Color(0xff596372), //
        onBackground: Color(0xff0F1729), //
        error: Color(0xffff5656), //
        errorContainer: Color(0xFFFFA41D), //
        onError: Color(0xffffffff),
        surface: Color(0xffE6EBF3),
        onSurface: Color(0xff596372), //
        tertiary: Color(0xff127255), //
        tertiaryContainer: Color(0xffBB79E5), //
        onTertiary: Color(0xffA1ABBC), //
        onSurfaceVariant: Color(0xff6F7490), //
        secondaryContainer: Color(0xFFE5E5E5), //
        onTertiaryContainer: Color(0xffDADADC), //
        onErrorContainer: Color(0xffffcc86), //
        inversePrimary: Color(0xff40a3ff),
        inverseSurface: Color(0xffadd328),
        onPrimaryContainer: Color(0xff024786),
        onInverseSurface: Color(0xffececec),
      );

  TimePickerThemeData get _timePickerTheme => TimePickerThemeData(backgroundColor: _colorSchemeLight.onSecondary);
  /* Text Theme For The App */

  TextTheme get _textThemeLight => TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.5,
          color: _colorSchemeLight.onBackground,
        ),
        displayMedium: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.5,
          color: _colorSchemeLight.onBackground,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        headlineLarge: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        headlineMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        headlineSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        labelLarge: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        labelMedium: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        bodyLarge: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        titleMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        titleSmall: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
      );

  /* Appbar Theme */

  AppBarTheme get _appBarTheme => AppBarTheme(
        backgroundColor: _colorSchemeLight.background,
        titleTextStyle: _textThemeLight.bodyMedium!.copyWith(color: _colorSchemeLight.onSurface),
      );

  /* Text Field Theme */

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        focusColor: _colorSchemeLight.secondaryContainer,
        labelStyle: _textThemeLight.labelLarge!.copyWith(color: _colorSchemeLight.onBackground.withOpacity(0.4)),
        floatingLabelStyle: _textThemeLight.labelLarge!.copyWith(color: _colorSchemeLight.onBackground.withOpacity(0.4)),
        hintStyle: _textThemeLight.labelLarge!.copyWith(color: _colorSchemeLight.onBackground.withOpacity(0.3)),
        helperStyle: _textThemeLight.titleSmall!.copyWith(color: _colorSchemeLight.primary),
        fillColor: _colorSchemeLight.secondaryContainer,
        prefixIconColor: _colorSchemeLight.onBackground.withOpacity(0.4),
        errorStyle: _textThemeLight.titleSmall!.copyWith(color: _colorSchemeLight.error),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _colorSchemeLight.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _colorSchemeLight.error),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: BorderSide(color: _colorSchemeLight.surface),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _colorSchemeLight.surface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 0,
          borderSide: BorderSide(color: _colorSchemeLight.primary),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _colorSchemeLight.surface),
        ),
      );

  /* Elevated Button Theme */

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _colorSchemeLight.onPrimary,
          backgroundColor: _colorSchemeLight.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3,
          textStyle: _textThemeLight.labelSmall,
        ),
      );
  OutlinedButtonThemeData get _outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _colorSchemeLight.onBackground,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(width: 2, color: _colorSchemeLight.primary),
          textStyle: _textThemeLight.labelSmall,
        ),
      );
}
