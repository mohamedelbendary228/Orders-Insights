import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:orders_insights/app/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller.persistentTabController,
      screens: controller.screens,
      items: controller.buildNavBarsItems(),
      stateManagement: false,
      onItemSelected: controller.onItemSelected,
      navBarHeight: 65,
      navBarStyle: NavBarStyle.style1,
      padding: const EdgeInsets.symmetric(vertical: 10),
      backgroundColor: Colors.white,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
        ),
      ),
    );
  }
}
