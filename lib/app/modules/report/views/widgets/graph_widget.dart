import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orders_insights/app/core/values/app_colors.dart';
import 'package:orders_insights/app/data/models/orders_graph_model.dart';
import 'package:orders_insights/app/modules/report/controllers/report_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphWidget extends GetView<ReportController> {
  const GraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: const ChartTitle(
        text: "This graph showing the number of orders for each month",
        textStyle: TextStyle(
          fontFamily: "Cairo",
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      primaryXAxis: DateTimeAxis(
        intervalType: DateTimeIntervalType.months,
        autoScrollingDeltaType: DateTimeIntervalType.months,
        enableAutoIntervalOnZooming: true,
        interval: 1,
        dateFormat: DateFormat.MMM(),
        axisLabelFormatter: (AxisLabelRenderDetails axisLabelRenderDetails) {
          return ChartAxisLabel(
            axisLabelRenderDetails.text,
            const TextStyle(
              color: AppColors.naturalDarkGray,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w600,
            ),
          );
        },
      ),
      primaryYAxis: NumericAxis(
        interval: 1,
        axisLabelFormatter: (AxisLabelRenderDetails axisLabelRenderDetails) {
          return ChartAxisLabel(
            axisLabelRenderDetails.text,
            const TextStyle(
              color: Colors.black,
              fontFamily: "Cairo",
            ),
          );
        },
        associatedAxisName: "Orders",
      ),
      series: [
        LineSeries<OrdersGraphModel, DateTime>(
          dataSource: controller.graphData,
          xValueMapper: (OrdersGraphModel ordersData, _) => ordersData.xDate,
          yValueMapper: (OrdersGraphModel ordersData, _) =>
              ordersData.yOrdersCount,
          markerSettings: const MarkerSettings(
            isVisible: true,
          ),
          color: AppColors.primaryColor,
        ),
      ],
      zoomPanBehavior: controller.zoomPanBehavior,
      tooltipBehavior: controller.tooltipBehavior,
      enableAxisAnimation: true,
    );
  }
}
