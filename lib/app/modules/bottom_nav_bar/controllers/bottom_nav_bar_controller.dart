import 'package:get/get.dart';
import 'package:orders_insights/app/core/widgets/toast.dart';
import 'package:orders_insights/app/data/models/orders_model.dart';
import 'package:orders_insights/app/data/providers/fetch_orders_list.dart';

class BottomNavBarController extends GetxController {
  late OrdersListProvider ordersListProvider;

  Rxn<OrdersModel> ordersModel = Rxn<OrdersModel>();

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ordersListProvider = Get.find<OrdersListProvider>();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      loading.value = true;

      ordersModel.value = await ordersListProvider.fetOrdersFromJsonFile();

      if (ordersModel.value != null && ordersModel.value?.data != null) {
        loading.value = false;
      }
    } catch (e) {
      loading.value = false;
      showToast(message: e.toString());
    }
  }
}
