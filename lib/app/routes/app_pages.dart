import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:orders_insights/app/modules/splash/bindings/splash_binding.dart';
import 'package:orders_insights/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const kINITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
