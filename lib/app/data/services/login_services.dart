import 'package:supabase_flutter/supabase_flutter.dart';

class LoginServices {
  final supabase = Supabase.instance.client.schema('pos');

  Future<bool> login(String storeName, String password) async {
    try {
      final response = await supabase.rpc(
        'store_login',
        params: {'store_name': storeName, 'input_password': password},
      );
      return response as bool;
    } catch (e) {
      print('service error: $e');
      return false;
    }
  }
}
