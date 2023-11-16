import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../init/notifier/theme_notifer.dart';

extension RefExtension on WidgetRef {
  MediaQueryData get mediaQuery => MediaQuery.of(context);
  ThemeData get theme => watch(themeProvider).themeData;
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  StackRouter get router => context.router;
  Locale get locale => EasyLocalization.of(context)!.locale;

  toggleTheme() => read(themeProvider.notifier).toggle();
}

extension MediaQueryExtension on WidgetRef {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get value1 => height * 0.01;
  double get value2 => height * 0.02;
  double get value3 => height * 0.03;
  double get value4 => height * 0.04;
  double get value5 => height * 0.05;
  double get value10 => height * 0.1;
}

extension BorderRadiusExtension on WidgetRef {
  BorderRadiusGeometry get borderRadius4 => BorderRadius.circular(4);
  BorderRadiusGeometry get borderRadius8 => BorderRadius.circular(8);
  BorderRadiusGeometry get borderRadius12 => BorderRadius.circular(12);
  BorderRadiusGeometry get borderRadius16 => BorderRadius.circular(16);
  BorderRadiusGeometry get borderRadius20 => BorderRadius.circular(20);
  BorderRadiusGeometry get borderRadius25 => BorderRadius.circular(25);
}

extension PaddingExtensionAll on WidgetRef {
  EdgeInsets get padding1 => EdgeInsets.all(value1);
  EdgeInsets get padding2 => EdgeInsets.all(value2);
  EdgeInsets get padding3 => EdgeInsets.all(value3);
  EdgeInsets get padding4 => EdgeInsets.all(value4);
  EdgeInsets get padding5 => EdgeInsets.all(value5);
  EdgeInsets get padding10 => EdgeInsets.all(value10);
}

extension PaddingExtensionSymetric on WidgetRef {
  EdgeInsets get paddingVertical1 => EdgeInsets.symmetric(vertical: value1);
  EdgeInsets get paddingVertical2 => EdgeInsets.symmetric(vertical: value2);
  EdgeInsets get paddingVertical3 => EdgeInsets.symmetric(vertical: value3);
  EdgeInsets get paddingVertical4 => EdgeInsets.symmetric(vertical: value4);
  EdgeInsets get paddingVertical5 => EdgeInsets.symmetric(vertical: value5);
  EdgeInsets get paddingVertical10 => EdgeInsets.symmetric(vertical: value10);

  EdgeInsets get paddingHorizontal1 => EdgeInsets.symmetric(horizontal: value1);
  EdgeInsets get paddingHorizontal2 => EdgeInsets.symmetric(horizontal: value2);
  EdgeInsets get paddingHorizontal3 => EdgeInsets.symmetric(horizontal: value3);
  EdgeInsets get paddingHorizontal4 => EdgeInsets.symmetric(horizontal: value4);
  EdgeInsets get paddingHorizontal5 => EdgeInsets.symmetric(horizontal: value5);
  EdgeInsets get paddingHorizontal10 =>
      EdgeInsets.symmetric(horizontal: value10);
}

extension PaddingExtensionOnly on WidgetRef {
  EdgeInsets get leftPadding1 => EdgeInsets.only(left: value1);
  EdgeInsets get leftPadding2 => EdgeInsets.only(left: value2);
  EdgeInsets get leftPadding3 => EdgeInsets.only(left: value3);
  EdgeInsets get leftPadding4 => EdgeInsets.only(left: value4);
  EdgeInsets get leftPadding5 => EdgeInsets.only(left: value5);
  EdgeInsets get leftPadding10 => EdgeInsets.only(left: value10);

  EdgeInsets get rightPadding1 => EdgeInsets.only(right: value1);
  EdgeInsets get rightPadding2 => EdgeInsets.only(right: value2);
  EdgeInsets get rightPadding3 => EdgeInsets.only(right: value3);
  EdgeInsets get rightPadding4 => EdgeInsets.only(right: value4);
  EdgeInsets get rightPadding5 => EdgeInsets.only(right: value5);
  EdgeInsets get rightPadding10 => EdgeInsets.only(right: value10);

  EdgeInsets get bottomPadding1 => EdgeInsets.only(bottom: value1);
  EdgeInsets get bottomPadding2 => EdgeInsets.only(bottom: value2);
  EdgeInsets get bottomPadding3 => EdgeInsets.only(bottom: value3);
  EdgeInsets get bottomPadding4 => EdgeInsets.only(bottom: value4);
  EdgeInsets get bottomPadding5 => EdgeInsets.only(bottom: value5);
  EdgeInsets get bottomPadding10 => EdgeInsets.only(bottom: value10);

  EdgeInsets get topPadding1 => EdgeInsets.only(top: value1);
  EdgeInsets get topPadding2 => EdgeInsets.only(top: value2);
  EdgeInsets get topPadding3 => EdgeInsets.only(top: value3);
  EdgeInsets get topPadding4 => EdgeInsets.only(top: value4);
  EdgeInsets get topPadding5 => EdgeInsets.only(top: value5);
  EdgeInsets get topPadding10 => EdgeInsets.only(top: value10);
}

extension PageExtension on WidgetRef {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on WidgetRef {
  Duration get duration100 => const Duration(milliseconds: 100);
  Duration get duration200 => const Duration(milliseconds: 200);
  Duration get duration300 => const Duration(milliseconds: 300);
  Duration get duration400 => const Duration(milliseconds: 400);
  Duration get duration500 => const Duration(milliseconds: 500);
  Duration get duration1000 => const Duration(milliseconds: 1000);
  Duration get duration2000 => const Duration(milliseconds: 2000);
  Duration get duration3000 => const Duration(milliseconds: 3000);
}
