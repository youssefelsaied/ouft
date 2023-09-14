// To parse this JSON data, do
//
//     final orderAdd = orderAddFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderAdd orderAddFromJson(String str) => OrderAdd.fromJson(json.decode(str));

String orderAddToJson(OrderAdd data) => json.encode(data.toJson());

class OrderAdd {
  bool error;
  String message;
  int statusCode;
  Data data;

  OrderAdd({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory OrderAdd.fromJson(Map<String, dynamic> json) => OrderAdd(
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
  dynamic time;
  dynamic status;
  String transactionId;
  String transactionType;
  int totalPrice;
  String address;

  Data({
    required this.id,
    required this.time,
    required this.status,
    required this.transactionId,
    required this.transactionType,
    required this.totalPrice,
    required this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        time: json["time"],
        status: json["status"],
        transactionId: json["transaction_id"],
        transactionType: json["transaction_type"],
        totalPrice: json["total_price"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "status": status,
        "transaction_id": transactionId,
        "transaction_type": transactionType,
        "total_price": totalPrice,
        "address": address,
      };
}
