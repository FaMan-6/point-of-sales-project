class CategoryModel {
  final int? id;
  final String name;
  final int? storeId;

  CategoryModel({this.id, required this.name, this.storeId});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      storeId: json['store_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'store_id': storeId};
  }
}
