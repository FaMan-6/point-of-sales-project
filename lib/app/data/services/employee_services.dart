import 'package:point_of_sales/app/data/models/employee_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmployeeServices {
  final supabase = Supabase.instance.client.schema('pos');

  Future<List<EmployeeModel>> getEmployees(int storeId) async {
    try {
      final response = await supabase.rpc(
        'get_cashiers',
        params: {'p_store_id': storeId},
      );
      final data = response as List;

      return data
          .map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('service error: $e');
      return [];
    }
  }
}
