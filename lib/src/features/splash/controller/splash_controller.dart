import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_mvc/src/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_riverpod_mvc/src/core/init/cache/locale_manager.dart';
import 'package:flutter_riverpod_mvc/src/core/init/navigation/navigation_route.dart';

final splashController =
    StateNotifierProvider.autoDispose<SplashController, SplashState>(
  (ref) => SplashController(ref: ref),
);

class SplashController extends StateNotifier<SplashState> {
  SplashController({required this.ref}) : super(const SplashState());
  StateNotifierProviderRef<SplashController, SplashState> ref;

  BuildContext? buildContext;

  LocaleManager localeManager = LocaleManager.instance;

  void setContext(BuildContext context) => buildContext = context;

  Future<void> init() async {
    await startTimer();
    localeManager.getStringValue(PreferencesKeys.TOKEN) != ''
        ? buildContext!.router.replace(const HomeRoute())
        : buildContext!.router.replace(const LoginRoute());
  }

  Future<void> startTimer() async {
    await Future.delayed(const Duration(seconds: 1));
    changeIsStarted();
    await Future.delayed(const Duration(seconds: 2));
  }

  void changeIsStarted() {
    state = state.copyWith(isStarted: !state.isStarted);
  }
}

class SplashState extends Equatable {
  final bool isStarted;
  const SplashState({this.isStarted = false});

  @override
  List<Object?> get props => [isStarted];

  SplashState copyWith({
    bool? isStarted,
  }) {
    return SplashState(
      isStarted: isStarted ?? this.isStarted,
    );
  }
}
