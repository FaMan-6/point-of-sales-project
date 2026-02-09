import 'package:point_of_sales/app/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductServices {
  final supabase = Supabase.instance.client.schema('pos');

  Future<bool> addProduct(
    String name,
    int categoryId,
    int price,
    int storeId,
  ) async {
    try {
      await supabase.rpc(
        'add_product',
        params: {
          'p_name': name,
          'p_category_id': categoryId,
          'p_price': price,
          'p_store_id': storeId,
        },
      );
      return true;
    } catch (e) {
      print('service error: $e');
      return false;
    }
  }

  Future<List<ProductModel>> getProducts(int id) async {
    try {
      final response = await supabase.rpc(
        'get_products',
        params: {'p_store_id': id},
      );
      final data = response as List;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      print('Service Error: $e');
      return [];
    }
  }
}
