import 'package:get/get.dart';
import 'package:orders_insights/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
      },
    );
  }
}
