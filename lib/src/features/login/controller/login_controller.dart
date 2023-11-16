import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_mvc/src/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_riverpod_mvc/src/core/init/cache/locale_manager.dart';
import 'package:flutter_riverpod_mvc/src/core/init/navigation/navigation_route.dart';
import 'package:flutter_riverpod_mvc/src/features/login/service/login_service.dart';

import '../../../core/utility/request_helper.dart';
import '../model/login_post_model.dart';

final loginController = StateNotifierProvider<LoginController, LoginState>(
    (ref) => LoginController(ref));
late final StateNotifierProvider<RequestStateNotifier, RequestStateState>
    loginServiceProvider;

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginState());
  BuildContext? buildContext;

  StateNotifierProviderRef<LoginController, LoginState> ref;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late LoginService loginService;

  LocaleManager localeManager = LocaleManager.instance;
  Dio _manager = Dio();

  Future<void> login() async {
    final notifier = ref.read(loginServiceProvider.notifier);
    if (formKey.currentState!.validate()) {
      await notifier.call(
        LoginPostModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
    // if (formKey.currentState!.validate()) {
    //   Response? response = await loginService.postLogin(LoginPostModel(
    //     email: emailController.text,
    //     password: passwordController.text,
    //   ));
    //   LoginResponseModel responseModel =
    //       LoginResponseModel.fromJson(response!.data!);
    //   if (response.statusCode == 200) {
    //     await localeManager.setStringValue(
    //         PreferencesKeys.TOKEN, responseModel.token.toString());
    //     state = state.copyWith(token: responseModel.token);
    //     buildContext!.router.replace(const HomeRoute());
    //   }
    //   return response;
    // } else {
    //   return null;
    // }
  }

  Future<void> init() async {
    loginService = LoginService(_manager);
    loginServiceProvider =
        StateNotifierProvider<RequestStateNotifier, RequestStateState>(
      (ref) {
        return RequestStateNotifier(
            ref, loginService.postLogin, postLoginAction);
      },
    );
    if (kDebugMode) {
      emailController.text = 'eve.holt@reqres.in';
      passwordController.text = 'cityslicka';
    }
  }

  Future<void> postLoginAction() async {
    final notifier = ref.read(loginServiceProvider.notifier);
    await Future.delayed(const Duration(seconds: 2));

    if (notifier.state.requestState.data != null) {
      await localeManager.setStringValue(PreferencesKeys.TOKEN,
          notifier.state.requestState.data!.token.toString());
      state = state.copyWith(token: notifier.state.requestState.data!.token);
      buildContext!.router.replace(const HomeRoute());
    }
  }

  void setContext(BuildContext context) => buildContext = context;

  void changePasswordVisibility() {
    state = state.copyWith(obscureText: !state.obscureText);
  }
}

class LoginState extends Equatable {
  final bool obscureText;
  final String token;

  const LoginState({this.obscureText = true, this.token = ''});
  @override
  List<Object?> get props => [obscureText, token];

  LoginState copyWith({bool? obscureText, String? token}) {
    return LoginState(
        obscureText: obscureText ?? this.obscureText,
        token: token ?? this.token);
  }
}
