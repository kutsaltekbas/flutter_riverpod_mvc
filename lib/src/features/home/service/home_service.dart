import 'package:dio/dio.dart';
import 'package:flutter_riverpod_mvc/src/core/constants/enums/network_route_enum.dart';

import '../model/user_data_model.dart';

class HomeService {
  const HomeService(this._manager);
  final Dio _manager;
  Future<Response?> getData(UserDataModel model) async {
    Response response = await _manager.get(
      NetworkRoutes.USER_DATA.rawValue,
      data: model,
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    return response;
  }
}
