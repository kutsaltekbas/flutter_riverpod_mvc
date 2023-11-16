import 'package:dio/dio.dart';
import 'package:flutter_riverpod_mvc/src/core/constants/enums/network_route_enum.dart';
import 'package:flutter_riverpod_mvc/src/features/login/model/login_post_model.dart';
import 'package:flutter_riverpod_mvc/src/features/login/model/login_response_model.dart';

class LoginService {
  const LoginService(this._manager);
  final Dio _manager;
  Future<LoginResponseModel?> postLogin(LoginPostModel model) async {
    Response response = await _manager.post(
      NetworkRoutes.LOGIN.rawValue,
      data: model.toJson(),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    return LoginResponseModel.fromJson(response.data);
  }
}
