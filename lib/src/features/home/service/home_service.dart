import 'package:dio/dio.dart';

import '../model/user_data_model.dart';

class HomeService {
  const HomeService(this._manager);
  final Dio _manager;
  Future<Response?> getData(UserDataModel model) async {
    Response response = await _manager.get(
      "https://reqres.in/api/users?page=1",
      data: model,
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    return response;
  }
}
