import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_mvc/src/features/login/model/login_post_model.dart';
import 'package:flutter_riverpod_mvc/src/features/login/model/login_response_model.dart';

import '../base/state.dart';
import '../constants/enums/loading_state_enum.dart';

class RequestStateNotifier extends StateNotifier<RequestStateState> {
  RequestStateNotifier(this.ref, this.method, this.successAction)
      : super(RequestStateState(requestState: RequestState()));

  StateNotifierProviderRef<RequestStateNotifier, RequestStateState> ref;
  Future<LoginResponseModel?> Function(LoginPostModel) method;
  void Function() successAction;

  void _setStateToLoading() {
    state.requestState.state = LoadingStateEnum.LOADING;
    state = state.copyWith(requestState: state.requestState);
  }

  void _setStateToData(LoginResponseModel? response) {
    state.requestState.data = response!;
    state.requestState.state = LoadingStateEnum.SUCCESS;
    state = state.copyWith(requestState: state.requestState);
  }

  void _setStateToError() {
    state.requestState.state = LoadingStateEnum.FAIL;
    state = state.copyWith(requestState: state.requestState);
  }

  void _setStateToNone() {
    state.requestState.state = LoadingStateEnum.NONE;
    state = state.copyWith(requestState: state.requestState);
  }

  Future<void> call(dynamic model) async {
    try {
      _setStateToLoading();
      final response = await method.call(model);
      if (response != null) {
        _setStateToData(response);
        successAction.call();
      } else {
        _setStateToNone();
      }
    } catch (e) {
      _setStateToError();
    }
  }
}

class RequestStateState extends Equatable {
  final RequestState requestState;
  const RequestStateState({required this.requestState});
  @override
  List<Object?> get props => [requestState];

  RequestStateState copyWith({RequestState? requestState}) {
    return RequestStateState(
      requestState: requestState ?? this.requestState,
    );
  }
}
