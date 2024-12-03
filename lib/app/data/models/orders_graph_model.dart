class OrdersGraphModel {
  final DateTime xDate;
  final int yOrdersCount;

  OrdersGraphModel({
    required this.xDate,
    required this.yOrdersCount,
  });

  @override
  String toString() =>
      'OrdersGraphModel(xDate: $xDate, yOrdersCount: $yOrdersCount)';
}
