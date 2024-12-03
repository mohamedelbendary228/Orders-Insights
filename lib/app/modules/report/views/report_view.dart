import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders_insights/app/core/widgets/custom_app_bar.dart';
import 'package:orders_insights/app/core/widgets/loading_widget.dart';
import 'package:orders_insights/app/modules/report/controllers/report_controller.dart';
import 'package:orders_insights/app/modules/report/views/widgets/graph_widget.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(text: "Report"),
          Obx(
            () => controller.loading.value
                ? const LoadingWidget()
                : const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: GraphWidget(),
                  ),
          )
        ],
      ),
    );
  }
}
