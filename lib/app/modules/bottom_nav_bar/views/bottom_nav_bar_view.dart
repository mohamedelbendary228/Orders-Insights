import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders_insights/app/core/widgets/default_text_widget.dart';
import 'package:orders_insights/app/core/widgets/loading_widget.dart';
import 'package:orders_insights/app/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> controller.loading.value? const LoadingWidget() : Center(
          child: AppDefaultText(
            "${controller.ordersModel.value!.data![0].price!}",
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
