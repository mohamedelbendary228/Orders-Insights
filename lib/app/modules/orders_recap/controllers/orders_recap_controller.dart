import 'package:get/get.dart';
import 'package:orders_insights/app/core/widgets/toast.dart';
import 'package:orders_insights/app/data/models/orders_model.dart';
import 'package:orders_insights/app/data/providers/orders__recap_provider.dart';

class OrdersRecapController extends GetxController {
  late OrdersRecapProvider ordersListProvider;

  Rxn<OrdersModel> ordersModel = Rxn<OrdersModel>();

  RxBool loading = false.obs;

  RxInt totalOrders = 0.obs;
  RxDouble averagePrice = 0.0.obs;
  RxInt numberOfReturns = 0.obs;

  @override
  void onInit() {
    super.onInit();
    ordersListProvider = Get.find<OrdersRecapProvider>();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      loading.value = true;
      ordersModel.value = await ordersListProvider.fetOrdersFromJsonFile();

      if (ordersModel.value != null && ordersModel.value?.data != null) {
        totalOrders.value = ordersModel.value!.data!.length;
        averagePrice.value = ordersModel.value!.data!.fold(0.0, (sum, item) {
          // Remove the dollar sign and commas, then parse as double
          String priceString = item.price!.replaceAll(RegExp(r'[\$,]'), '');
          double price = double.parse(priceString);
          return sum + price;
        });
        numberOfReturns.value = ordersModel.value!.data!
            .where((element) => element.status == "RETURNED")
            .toList()
            .length;

        loading.value = false;
      }
    } catch (e) {
      loading.value = false;
      showToast(message: e.toString());
    }
  }

  void onRefesh() {
    fetchOrders();
  }
}
