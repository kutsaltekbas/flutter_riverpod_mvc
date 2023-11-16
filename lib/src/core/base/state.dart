import 'package:flutter_riverpod_mvc/src/features/login/model/login_response_model.dart';

import '../constants/enums/loading_state_enum.dart';

class RequestState {
  LoadingStateEnum state;
  LoginResponseModel? data;

  RequestState({this.state = LoadingStateEnum.NONE, this.data});

  void toLoading() {
    state = LoadingStateEnum.LOADING;
  }

  void toData() {
    state = LoadingStateEnum.SUCCESS;
  }
}
