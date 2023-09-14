// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  bool error;
  String message;
  int statusCode;
  List<CartItemData> data;
  int lastPage;

  Cart({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
    required this.lastPage,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<CartItemData>.from(
            json["data"].map((x) => CartItemData.fromJson(x))),
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

class CartItemData {
  int id;
  String userId;
  int productId;
  int quantity;
  Product product;

  CartItemData({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.product,
  });

  factory CartItemData.fromJson(Map<String, dynamic> json) => CartItemData(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "quantity": quantity,
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
