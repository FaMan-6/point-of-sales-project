import 'package:point_of_sales/app/data/models/category_model.dart';

class ProductModel {
  final int? id;
  final String name;
  final int? categoryId;
  final int price;
  final CategoryModel category;

  ProductModel({
    this.id,
    required this.name,
    this.categoryId,
    required this.price,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['product_id'],
      name: json['product_name'],
      price: json['price'],
      category: CategoryModel.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'category_id': categoryId, 'price': price};
  }
}
