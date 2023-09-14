// To parse this JSON data, do
//
//     final orderGet = orderGetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderGet orderGetFromJson(String str) => OrderGet.fromJson(json.decode(str));

String orderGetToJson(OrderGet data) => json.encode(data.toJson());

class OrderGet {
  bool error;
  String message;
  int statusCode;
  List<OrderGetData> data;
  int lastPage;

  OrderGet({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
    required this.lastPage,
  });

  factory OrderGet.fromJson(Map<String, dynamic> json) => OrderGet(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<OrderGetData>.from(
            json["data"].map((x) => OrderGetData.fromJson(x))),
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "last_page": lastPage,
      };
}

class OrderGetData {
  int id;
  DateTime time;
  String status;
  String transactionId;
  String transactionType;
  String totalPrice;
  String address;
  List<OrderItem> orderItems;

  OrderGetData({
    required this.id,
    required this.time,
    required this.status,
    required this.transactionId,
    required this.transactionType,
    required this.totalPrice,
    required this.address,
    required this.orderItems,
  });

  factory OrderGetData.fromJson(Map<String, dynamic> json) => OrderGetData(
        id: json["id"],
        time: DateTime.parse(json["time"]),
        status: json["status"],
        transactionId: json["transaction_id"],
        transactionType: json["transaction_type"],
        totalPrice: json["total_price"],
        address: json["address"],
        orderItems: List<OrderItem>.from(
            json["order_items"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time.toIso8601String(),
        "status": status,
        "transaction_id": transactionId,
        "transaction_type": transactionType,
        "total_price": totalPrice,
        "address": address,
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
      };
}

class OrderItem {
  int id;
  dynamic itemId;
  int quantity;
  int price;
  String size;
  Product product;

  OrderItem({
    required this.id,
    required this.itemId,
    required this.quantity,
    required this.price,
    required this.size,
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        itemId: json["item_id"],
        quantity: json["quantity"],
        price: json["price"],
        size: json["size"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_id": itemId,
        "quantity": quantity,
        "price": price,
        "size": size,
        "product": product.toJson(),
      };
}

class Product {
  int id;
  String name;
  String image;
  int price;
  int finalPrice;
  int discount;
  String description;
  int rating;
  bool bookmark;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.finalPrice,
    required this.discount,
    required this.description,
    required this.rating,
    required this.bookmark,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        finalPrice: json["final_price"],
        discount: json["discount"],
        description: json["description"],
        rating: json["rating"],
        bookmark: json["bookmark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "final_price": finalPrice,
        "discount": discount,
        "description": description,
        "rating": rating,
        "bookmark": bookmark,
      };
}
