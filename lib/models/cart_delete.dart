// To parse this JSON data, do
//
//     final cartDelete = cartDeleteFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CartDelete cartDeleteFromJson(String str) =>
    CartDelete.fromJson(json.decode(str));

String cartDeleteToJson(CartDelete data) => json.encode(data.toJson());

class CartDelete {
  bool error;
  String message;
  int statusCode;
  String data;

  CartDelete({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory CartDelete.fromJson(Map<String, dynamic> json) => CartDelete(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": data,
      };
}
