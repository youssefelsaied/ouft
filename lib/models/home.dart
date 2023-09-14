// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'package:ouft/models/category.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Home homeFromJson(String str) => Home.fromJson(json.decode(str));

String homeToJson(Home data) => json.encode(data.toJson());

class Home {
  bool error;
  String message;
  int statusCode;
  Data data;

  Home({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
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
  List<HomeSlider> slider;
  About about;
  List<OurProduct> ourProducts;
  List<CategoryData> categories;
  List<OurProduct> suggestions;

  Data({
    required this.slider,
    required this.about,
    required this.ourProducts,
    required this.categories,
    required this.suggestions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        slider: List<HomeSlider>.from(
            json["slider"].map((x) => HomeSlider.fromJson(x))),
        about: About.fromJson(json["about"]),
        ourProducts: List<OurProduct>.from(
            json["our_products"].map((x) => OurProduct.fromJson(x))),
        categories: List<CategoryData>.from(
            json["categories"].map((x) => CategoryData.fromJson(x))),
        suggestions: List<OurProduct>.from(
            json["suggestions"].map((x) => OurProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slider": List<dynamic>.from(slider.map((x) => x.toJson())),
        "about": about.toJson(),
        "our_products": List<dynamic>.from(ourProducts.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "suggestions": List<dynamic>.from(suggestions.map((x) => x.toJson())),
      };
}

class About {
  String title;
  String description;

  About({
    required this.title,
    required this.description,
  });

  factory About.fromJson(Map<String, dynamic> json) => About(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

class OurProduct {
  int id;
  String name;
  String image;
  int price;
  int finalPrice;
  int discount;
  String description;
  int rating;
  bool bookmark;

  OurProduct({
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

  factory OurProduct.fromJson(Map<String, dynamic> json) => OurProduct(
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

class HomeSlider {
  int id;
  String type;
  String typeId;
  String image;

  HomeSlider({
    required this.id,
    required this.type,
    required this.typeId,
    required this.image,
  });

  factory HomeSlider.fromJson(Map<String, dynamic> json) => HomeSlider(
        id: json["id"],
        type: json["type"],
        typeId: json["type_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "type_id": typeId,
        "image": image,
      };
}
