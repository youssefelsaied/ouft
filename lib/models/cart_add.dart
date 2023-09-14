// To parse this JSON data, do
//
//     final cartAdd = cartAddFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CartAdd cartAddFromJson(String str) => CartAdd.fromJson(json.decode(str));

String cartAddToJson(CartAdd data) => json.encode(data.toJson());

class CartAdd {
  bool error;
  String message;
  int statusCode;
  Data data;

  CartAdd({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory CartAdd.fromJson(Map<String, dynamic> json) => CartAdd(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  String userId;
  int productId;
  int quantity;

  Data({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "quantity": quantity,
      };
}
