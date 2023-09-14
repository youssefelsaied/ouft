// To parse this JSON data, do
//
//     final bookingAdd = bookingAddFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BookingAdd bookingAddFromJson(String str) =>
    BookingAdd.fromJson(json.decode(str));

String bookingAddToJson(BookingAdd data) => json.encode(data.toJson());

class BookingAdd {
  bool error;
  String message;
  int statusCode;
  BookingData data;

  BookingAdd({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory BookingAdd.fromJson(Map<String, dynamic> json) => BookingAdd(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: BookingData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": data.toJson(),
      };
}

class BookingData {
  int id;
  String userId;
  int itemId;
  String status;
  DateTime date;
  String time;
  int price;
  Item item;
  Service service;
  Section section;

  BookingData({
    required this.id,
    required this.userId,
    required this.itemId,
    required this.status,
    required this.date,
    required this.time,
    required this.price,
    required this.item,
    required this.service,
    required this.section,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        id: json["id"],
        userId: json["user_id"],
        itemId: json["item_id"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        price: json["price"],
        item: Item.fromJson(json["item"]),
        service: Service.fromJson(json["service"]),
        section: Section.fromJson(json["section"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "item_id": itemId,
        "status": status,
        "date": date.toIso8601String(),
        "time": time,
        "price": price,
        "item": item.toJson(),
        "service": service.toJson(),
        "section": section.toJson(),
      };
}

class Item {
  int id;
  String title;
  String address;
  String image;
  int rating;
  bool bookmark;
  String firstNumber;
  String secondNumber;
  String lat;
  String long;
  Section category;

  Item({
    required this.id,
    required this.title,
    required this.address,
    required this.image,
    required this.rating,
    required this.bookmark,
    required this.firstNumber,
    required this.secondNumber,
    required this.lat,
    required this.long,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        image: json["image"],
        rating: json["rating"],
        bookmark: json["bookmark"],
        firstNumber: json["first_number"],
        secondNumber: json["second_number"],
        lat: json["lat"],
        long: json["long"],
        category: Section.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "image": image,
        "rating": rating,
        "bookmark": bookmark,
        "first_number": firstNumber,
        "second_number": secondNumber,
        "lat": lat,
        "long": long,
        "category": category.toJson(),
      };
}

class Section {
  int id;
  String title;
  String image;

  Section({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}

class Service {
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
  List<SimilarService> similarServices;

  Service({
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
    required this.similarServices,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
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
        similarServices: List<SimilarService>.from(
            json["similar_services"].map((x) => SimilarService.fromJson(x))),
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
        "similar_services":
            List<dynamic>.from(similarServices.map((x) => x.toJson())),
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
