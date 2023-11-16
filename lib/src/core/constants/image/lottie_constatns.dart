class LottieImageConstants {
  static LottieImageConstants? _instace;

  static LottieImageConstants get instance =>
      _instace ??= LottieImageConstants._init();

  LottieImageConstants._init();
  String get loadingAnimation => toLottie("loading_animation");
  String get loginSuccesfullAnimation => toLottie("login_successful");
  String get loginErrorAnimation => toLottie("login_error");
  String get emptyDataAnimation => toLottie("empty_data");

  String toLottie(String name) => 'assets/lottie/$name.json';
}
