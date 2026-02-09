import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:point_of_sales/app/data/widgets/widgets.dart';
import 'package:point_of_sales/app/modules/product/controllers/product_controller.dart';
import 'package:point_of_sales/app/views/views/default_field_view.dart';

class AddCategoryView extends GetView {
  final ProductController controller;
  const AddCategoryView({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => controller.closeEditor(),
                icon: Icon(Icons.close),
              ),
              Text(
                'Add Category',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Stack(
              children: [
                Form(
                  child: Column(
                    children: [
                      DefaultFieldView(
                        label: 'Category Name',
                        hint: 'Category Name',
                        controller: controller.categoryNameController,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 0,
                  left: 0,
                  child: DefaultButton(
                    text: 'Add Category',
                    onPress: () => controller.addCategory(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
