import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:point_of_sales/app/data/models/employee_model.dart';

class EmployeePickerView extends GetView {
  final List<EmployeeModel> employees;
  final Function(int) onChanged;
  const EmployeePickerView({
    super.key,
    required this.employees,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: 'Select Employee',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        items: employees.map((e) {
          return DropdownMenuItem(value: e.id, child: Text(e.name.toString()));
        }).toList(),
        onChanged: (value) {
          onChanged(value as int);
        },
      );
    });
  }
}
