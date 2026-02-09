import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:point_of_sales/app/modules/product/controllers/product_controller.dart';

class CategoryPickerView extends GetView {
  final ProductController controller;

  CategoryPickerView({super.key, required this.controller});

  final int categoryEmptyValue = -99;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: 'Select Category',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        items: controller.categories.isEmpty
            ? [
                DropdownMenuItem(
                  value: categoryEmptyValue,
                  child: GestureDetector(
                    onTap: () => controller.openCategoryEditor(),
                    child: Text(
                      'Add New Category',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ]
            : controller.categories.map((e) {
                return DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name.toString()),
                );
              }).toList(),
        onChanged: (value) {
          controller.selectedCategoryId.value = value as int;
        },
      );
    });
  }
}
