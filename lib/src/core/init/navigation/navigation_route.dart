import 'package:auto_route/auto_route.dart';
import '../../../features/splash/view/splash_view.dart';
import '../../../features/login/view/login_view.dart';
import '../../../features/home/view/home_view.dart';
part 'navigation_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
        )
      ];
}
