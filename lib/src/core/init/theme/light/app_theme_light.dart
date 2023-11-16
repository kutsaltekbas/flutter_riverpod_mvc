import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app/app_constants.dart';

class AppThemeLight {
  static AppThemeLight? _instance;
  static AppThemeLight get instance => _instance ??= AppThemeLight._init();

  AppThemeLight._init();

  /* Color Palette For The App. */
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        fontFamily: ApplicationConstants.FONT,
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
        primary: Color(0xff151515), //
        primaryContainer: Color(0xfffabb41), //
        secondary: Color(0xffFF833E), //
        onSecondary: Color(0xff7367F0),
        onPrimary: Color(0xfff6f8f9), //
        background: Color(0xffffffff), //
        onBackground: Color(0xff0F1729), //
        error: Color(0xffff5656), //
        errorContainer: Color(0xFFff833e), //
        onError: Color(0xff727C88),
        surface: Color(0xffE6EBF3),
        onSurface: Color(0xff596372), //
        tertiary: Color(0xff4E77E0), //
        tertiaryContainer: Color(0xff7367F0), //
        onTertiary: Color(0xffA1ABBC), //
        onSurfaceVariant: Color(0xff424242), //
        secondaryContainer: Color(0xFFE5E5E5), //
        onTertiaryContainer: Color(0xff666973), //
        onErrorContainer: Color(0xffB5BDCF), //
        inversePrimary: Color(0xff3D73F5),
        inverseSurface: Color(0xff0d1c2e),
        onPrimaryContainer: Color(0xff17D3A5),
        onInverseSurface: Color(0xff1A1E28),
      );

  TimePickerThemeData get _timePickerTheme =>
      TimePickerThemeData(backgroundColor: _colorSchemeLight.onSecondary);
  /* Text Theme For The App */

  TextTheme get _textThemeLight => TextTheme(
        displayLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        displayMedium: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        displaySmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        headlineSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        labelSmall: TextStyle(
          fontSize: 16.sp,
          letterSpacing: -0.5,
          fontWeight: FontWeight.w500,
          color: _colorSchemeLight.onBackground,
        ),
        bodyLarge: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.tertiary,
        ),
        bodyMedium: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onTertiary,
        ),
        titleLarge: TextStyle(
          fontSize: 27.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        titleMedium: TextStyle(
          fontSize: 21.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        titleSmall: TextStyle(
          fontSize: 19.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onBackground,
        ),
        labelLarge: TextStyle(
          fontSize: 33.sp,
          fontWeight: FontWeight.w400,
          color: _colorSchemeLight.onPrimary,
        ),
      );

  /* Appbar Theme */

  AppBarTheme get _appBarTheme => AppBarTheme(
        backgroundColor: _colorSchemeLight.background,
        titleTextStyle: _textThemeLight.bodyMedium!
            .copyWith(color: _colorSchemeLight.onSurface),
      );

  /* Text Field Theme */

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        focusColor: _colorSchemeLight.secondaryContainer,
        labelStyle: _textThemeLight.labelLarge!
            .copyWith(color: _colorSchemeLight.onBackground.withOpacity(0.4)),
        floatingLabelStyle: _textThemeLight.labelLarge!
            .copyWith(color: _colorSchemeLight.onBackground.withOpacity(0.4)),
        hintStyle: _textThemeLight.labelLarge!
            .copyWith(color: _colorSchemeLight.onBackground.withOpacity(0.3)),
        helperStyle: _textThemeLight.titleSmall!
            .copyWith(color: _colorSchemeLight.primary),
        fillColor: _colorSchemeLight.secondaryContainer,
        prefixIconColor: _colorSchemeLight.onBackground.withOpacity(0.4),
        errorStyle: _textThemeLight.titleSmall!
            .copyWith(color: _colorSchemeLight.error),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(width: 2, color: _colorSchemeLight.primary),
          textStyle: _textThemeLight.labelSmall,
        ),
      );
}
