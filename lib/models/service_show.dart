// To parse this JSON data, do
//
//     final serviceShow = serviceShowFromJson(jsonString);

import 'package:ouft/models/section_show.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ServiceShow serviceShowFromJson(String str) =>
    ServiceShow.fromJson(json.decode(str));

String serviceShowToJson(ServiceShow data) => json.encode(data.toJson());

class ServiceShow {
  bool error;
  String message;
  int statusCode;
  ServiceShowData data;

  ServiceShow({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory ServiceShow.fromJson(Map<String, dynamic> json) => ServiceShow(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: ServiceShowData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": data.toJson(),
      };
}

class ServiceShowData {
  int id;
  int itemId;
  int itemSectionId;
  String name;
  String description;
  String sku;
  String image;
  int price;
  int finalPrice;
  int discount;
  int rating;
  bool bookmark;
  List<ServiceImage> images;
  List<Service> similarServices;

  ServiceShowData({
    required this.id,
    required this.itemId,
    required this.itemSectionId,
    required this.name,
    required this.description,
    required this.sku,
    required this.image,
    required this.price,
    required this.finalPrice,
    required this.discount,
    required this.rating,
    required this.bookmark,
    required this.images,
    required this.similarServices,
  });

  factory ServiceShowData.fromJson(Map<String, dynamic> json) =>
      ServiceShowData(
        id: json["id"],
        itemId: json["item_id"],
        itemSectionId: json["item_section_id"],
        name: json["name"],
        description: json["description"],
        sku: json["sku"],
        image: json["image"],
        price: json["price"],
        finalPrice: json["final_price"],
        discount: json["discount"],
        rating: json["rating"],
        bookmark: json["bookmark"],
        images: List<ServiceImage>.from(
            json["images"].map((x) => ServiceImage.fromJson(x))),
        similarServices: List<Service>.from(
            json["similar_services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_id": itemId,
        "item_section_id": itemSectionId,
        "name": name,
        "description": description,
        "sku": sku,
        "image": image,
        "price": price,
        "final_price": finalPrice,
        "discount": discount,
        "rating": rating,
        "bookmark": bookmark,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "similar_services":
            List<dynamic>.from(similarServices.map((x) => x.toJson())),
      };
}

class ServiceImage {
  int id;
  int itemId;
  String image;

  ServiceImage({
    required this.id,
    required this.itemId,
    required this.image,
  });

  factory ServiceImage.fromJson(Map<String, dynamic> json) => ServiceImage(
        id: json["id"],
        itemId: json["item_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_id": itemId,
        "image": image,
      };
}

class SimilarService {
  int id;
  int itemId;
  String name;
  String image;
  int price;
  int finalPrice;
  int discount;
  int rating;
  bool bookmark;

  SimilarService({
    required this.id,
    required this.itemId,
    required this.name,
    required this.image,
    required this.price,
    required this.finalPrice,
    required this.discount,
    required this.rating,
    required this.bookmark,
  });

  factory SimilarService.fromJson(Map<String, dynamic> json) => SimilarService(
        id: json["id"],
        itemId: json["item_id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        finalPrice: json["final_price"],
        discount: json["discount"],
        rating: json["rating"],
        bookmark: json["bookmark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_id": itemId,
        "name": name,
        "image": image,
        "price": price,
        "final_price": finalPrice,
        "discount": discount,
        "rating": rating,
        "bookmark": bookmark,
      };
}
