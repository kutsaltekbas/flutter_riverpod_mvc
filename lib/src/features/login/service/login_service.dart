import 'package:dio/dio.dart';
import 'package:flutter_riverpod_mvc/src/features/login/model/login_post_model.dart';

class LoginService {
  const LoginService(this._manager);
  final Dio _manager;
  Future<Response?> postLogin(LoginPostModel model) async {
    Response response = await _manager.post(
      "https://reqres.in/api/login",
      data: model.toJson(),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    return response;
  }
}
