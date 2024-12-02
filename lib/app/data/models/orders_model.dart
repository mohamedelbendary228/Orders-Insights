class OrdersModel {
  List<Order>? data;

  OrdersModel({this.data});

  OrdersModel.fromJson(dynamic json) {
    data = [];
    for (var v in json) {
      data?.add(Order.fromJson(v));
    }
  }
}

class Order {
  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  List<String>? tags;
  String? status;
  String? registered;

  Order({
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.tags,
    this.status,
    this.registered,
  });

  Order.fromJson(dynamic json) {
    id = json['id'];
    isActive = json['isActive'];
    price = json['price'];
    company = json['company'];
    picture = json['picture'];
    buyer = json['buyer'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    status = json['status'];
    registered = json['registered'];
  }
}
