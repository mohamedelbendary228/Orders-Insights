import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders_insights/app/core/values/app_colors.dart';
import 'package:orders_insights/app/core/widgets/custom_app_bar.dart';
import 'package:orders_insights/app/core/widgets/default_text_widget.dart';

import 'package:orders_insights/app/modules/orders_recap/controllers/orders_recap_controller.dart';
import 'package:orders_insights/app/modules/orders_recap/views/widgets/recap_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersRecapView extends GetView<OrdersRecapController> {
  const OrdersRecapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(text: "Orders"),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.onRefesh();
                },
                color: AppColors.primaryColor,
                backgroundColor: Colors.white,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeletonizer(
                        enabled: controller.loading.value,
                        child: const AppDefaultText(
                          "Orders Recap",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      RecapCard(
                        title: "Total Count",
                        subTitle: "The total number of orders:",
                        number: "${controller.totalOrders.value}",
                        loading: controller.loading.value,
                      ),
                      RecapCard(
                        title: "Average Price",
                        subTitle: "The average price of your orders:",
                        number:
                            controller.averagePrice.value.toStringAsFixed(2),
                        loading: controller.loading.value,
                      ),
                      RecapCard(
                        title: "Number Of Returns",
                        subTitle: "The total number returned orders",
                        number: "${controller.numberOfReturns.value}",
                        loading: controller.loading.value,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
