import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_mvc/src/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_riverpod_mvc/src/core/init/cache/locale_manager.dart';
import 'package:flutter_riverpod_mvc/src/core/init/navigation/navigation_route.dart';
import 'package:flutter_riverpod_mvc/src/features/home/model/user_data_model.dart';
import 'package:flutter_riverpod_mvc/src/features/home/service/home_service.dart';
import 'package:flutter_riverpod_mvc/src/features/login/controller/login_controller.dart';

import '../../../core/utility/request_helper.dart';

final homeController = StateNotifierProvider<HomeController, HomeState>(
    (ref) => HomeController(ref));
late final StateNotifierProvider<RequestStateNotifier, RequestStateState>
    homeServiceProvider;
final getUserDataProvider = FutureProvider.autoDispose(
  (ref) => ref.watch(homeController.notifier).getUsers(),
);

class HomeController extends StateNotifier<HomeState> {
  HomeController(this.ref) : super(const HomeState());
  BuildContext? buildContext;

  StateNotifierProviderRef<HomeController, HomeState> ref;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LocaleManager localeManager = LocaleManager.instance;

  Dio _manager = Dio();
  late HomeService service;

  void init() {
    service = HomeService(_manager);
    print(ref.read(loginController).token);
  }

  Future<void> logout() async {
    localeManager.setStringValue(PreferencesKeys.TOKEN, '');
    buildContext!.router.replace(const LoginRoute());
  }

  Future<List<UserInfoModel?>?> getUsers() async {
    var response = await service.getData(UserDataModel());
    if (response != null && response.statusCode == 200) {
      return UserDataModel.fromJson(response.data).data;
    }
    return [];
  }

  void setContext(BuildContext context) => buildContext = context;
}

class HomeState extends Equatable {
  final bool obscureText;

  const HomeState({this.obscureText = true});
  @override
  List<Object?> get props => [obscureText];

  HomeState copyWith({bool? obscureText}) {
    return HomeState(
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
