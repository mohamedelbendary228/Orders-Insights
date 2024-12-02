import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:orders_insights/app/data/models/orders_model.dart';

class OrdersRecapProvider {
  Future<OrdersModel> fetOrdersFromJsonFile() async {
    String jsonString = await rootBundle.loadString('assets/orders.json');

    final jsonData = jsonDecode(jsonString);

    final result = OrdersModel.fromJson(jsonData);

    return Future.delayed(const Duration(milliseconds: 1500), () => result);
  }
}
