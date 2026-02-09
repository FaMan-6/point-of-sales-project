import 'package:point_of_sales/app/data/models/store_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginServices {
  final supabase = Supabase.instance.client.schema('pos');

  Future<int> login(String storeName, String password) async {
    try {
      final response = await supabase.rpc(
        'login_store',
        params: {'p_name': storeName, 'p_password': password},
      );
      return response as int;
    } catch (e) {
      print('service error: $e');
      return 0;
    }
  }

  Future<Store> getStore(String storeName) async {
    try {
      final response = await supabase
          .rpc('get_store_profile', params: {'store_name': storeName})
          .single();
      return Store.fromJson(response);
    } catch (e) {
      print('service error: $e');
      return Store(id: 0, name: '', address: '', phone: '');
    }
  }
}
