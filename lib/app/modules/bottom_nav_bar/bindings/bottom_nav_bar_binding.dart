import 'package:get/get.dart';
import 'package:orders_insights/app/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
  }
}
