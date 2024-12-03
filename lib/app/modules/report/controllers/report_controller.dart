import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orders_insights/app/core/values/app_colors.dart';
import 'package:orders_insights/app/core/widgets/toast.dart';
import 'package:orders_insights/app/data/models/orders_graph_model.dart';
import 'package:orders_insights/app/data/models/orders_model.dart';
import 'package:orders_insights/app/data/providers/orders__recap_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportController extends GetxController {
  late OrdersRecapProvider ordersListProvider;

  Rxn<OrdersModel> ordersModel = Rxn<OrdersModel>();

  RxBool loading = false.obs;

  late ZoomPanBehavior zoomPanBehavior;
  late TooltipBehavior tooltipBehavior;
  List<OrdersGraphModel> graphData = [];

  late RxList<CartesianSeries<dynamic, dynamic>> series;

  @override
  void onInit() {
    super.onInit();
    ordersListProvider = Get.find<OrdersRecapProvider>();
    zoomPanBehavior = ZoomPanBehavior(
      enableDoubleTapZooming: true,
      enablePanning: true,
      enableMouseWheelZooming: true,
      enablePinching: true,
    );
    tooltipBehavior = TooltipBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      textStyle: TextStyle(
        fontFamily: "Cairo",
        fontSize: 12.sp,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      header: "",
      duration: 1500,
      animationDuration: 1000,
    );
    fetchGraphData();
    series = RxList(
      [
        LineSeries<OrdersGraphModel, DateTime>(
          dataSource: graphData,
          xValueMapper: (OrdersGraphModel ordersData, _) => ordersData.xDate,
          yValueMapper: (OrdersGraphModel ordersData, _) =>
              ordersData.yOrdersCount,
          markerSettings: const MarkerSettings(
            isVisible: true,
          ),
          color: AppColors.primaryColor,
        ),
      ],
    );
  }

  Future<void> fetchGraphData() async {
    try {
      loading.value = true;
      ordersModel.value = await ordersListProvider.fetOrdersFromJsonFile();

      if (ordersModel.value != null && ordersModel.value?.data != null) {
        initChartData(ordersModel.value!);
        loading.value = false;
      }
    } catch (e) {
      loading.value = false;
      showToast(message: e.toString());
    }
  }

  void initChartData(OrdersModel orders) {
    Map<String, int> orderCountsByDate = {};
    for (int i = 0; i < orders.data!.length; i++) {
      String registeredDate = orders.data![i].registered!;
      DateTime parsedDate = DateTime.parse(registeredDate);
      String dateOnly = "${parsedDate.month}";
      if (orderCountsByDate.containsKey(dateOnly)) {
        orderCountsByDate[dateOnly] = orderCountsByDate[dateOnly]! + 1;
      } else {
        orderCountsByDate[dateOnly] = 1;
      }
    }

    orderCountsByDate.forEach((date, count) {
      graphData.add(
        OrdersGraphModel(
          xDate: DateTime(2024, int.parse(date)),
          yOrdersCount: count,
        ),
      );
    });

    // Sort the graphData by xDate for proper visualization
    graphData.sort((a, b) => a.xDate.compareTo(b.xDate));

    debugPrint("orderCountsByDate --------- $orderCountsByDate");
    debugPrint("graphData --------- $graphData");
  }

  // void switchSeries() {}
}
