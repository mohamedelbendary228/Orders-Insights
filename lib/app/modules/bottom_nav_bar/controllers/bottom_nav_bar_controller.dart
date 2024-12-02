import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orders_insights/app/core/values/app_assets.dart';
import 'package:orders_insights/app/core/values/app_colors.dart';
import 'package:orders_insights/app/modules/orders_recap/controllers/orders_recap_controller.dart';
import 'package:orders_insights/app/modules/orders_recap/views/orders_recap_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBarController extends GetxController {
  PersistentTabController? persistentTabController = PersistentTabController();

  int selectedIndex = 0;

  final List<Widget> screens = [
    const OrdersRecapView(),
    Container(),
  ];

  @override
  void onInit() {
    super.onInit();
    Get.put(OrdersRecapController());
  }

  List<PersistentBottomNavBarItem> buildNavBarsItems() {
    const activeColorPrimary = AppColors.primaryColor;
    const inactiveColorPrimary = Color(0xFF80A997);
    const textStyle = TextStyle(
      fontFamily: "Cairo",
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );

    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppAssets.cartIco),
        //inactiveIcon: SvgPicture.asset(AppAssets.homeOutlineIcon),
        title: "Orders",
        activeColorPrimary: activeColorPrimary,
        inactiveColorPrimary: inactiveColorPrimary,
        textStyle: textStyle,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppAssets.chartIcon),
        //inactiveIcon: Image.asset(AppAssets.requestsIconDisabled),
        title: "Reports",
        activeColorPrimary: activeColorPrimary,
        inactiveColorPrimary: inactiveColorPrimary,
        textStyle: textStyle,
      ),
    ];
  }

  void onItemSelected(int value) {
    selectedIndex = value;
    debugPrint("selectedIndex $selectedIndex");
    if (selectedIndex == 0) {
      if (!Get.isRegistered<OrdersRecapController>()) {
        Get.put(OrdersRecapController());
      }
    }
  }
}
