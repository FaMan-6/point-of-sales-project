import 'package:point_of_sales/app/data/models/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoryServices {
  final supabase = Supabase.instance.client.schema('pos');

  Future<bool> addCategory(String name, int storeId) async {
    try {
      await supabase.rpc(
        'add_category',
        params: {'p_name': name, 'p_store_id': storeId},
      );
      return true;
    } catch (e) {
      print('service error: $e');
      return false;
    }
  }

  Future<List<CategoryModel>> getCategories(int storeId) async {
    try {
      final response = await supabase.rpc(
        'get_category',
        params: {'p_id': storeId},
      );
      final list = response as List;
      return list
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('service error: $e');
      return [];
    }
  }
}
