//import 'package:flutter/foundation.dart';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final String image;
  final String description;
  final String categoryName;
  final int availability;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.categoryName,
    required this.availability,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json["id"] as num?)?.toInt() ?? 0,
      name: json["name"] ?? "",
      price: (json["price"] as num?)?.toDouble() ?? 0,
      image: json["image"] ?? "",
      description: json["description"] ?? "",
      categoryName: json["category"]?["name"] ?? "",
      availability: (json["availability"] as num?)?.toInt() ?? 0,
    );
  }
  
}

class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this. id,
    required this. name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
    id: (json['id'] as num?)?.toInt() ?? 0,
    name: json['name'] ?? '',
    );
  }

}