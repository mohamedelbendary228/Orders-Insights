import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orders_insights/app/data/models/orders_model.dart';

class OrdersListProvider {
  Future<OrdersModel> fetOrdersFromJsonFile() async {
    String jsonString = await rootBundle.loadString('assets/orders.json');

    final jsonData = jsonDecode(jsonString);

    final result = OrdersModel.fromJson(jsonData);

    return Future.delayed(const Duration(milliseconds: 1200), () => result);
  }
}
