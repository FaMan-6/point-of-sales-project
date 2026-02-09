import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:point_of_sales/app/data/widgets/widgets.dart';
import 'package:point_of_sales/app/modules/product/controllers/product_controller.dart';
import 'package:point_of_sales/app/views/views/add_image_view.dart';
import 'package:point_of_sales/app/views/views/category_picker_view.dart';
import 'package:point_of_sales/app/views/views/default_field_view.dart';
import 'package:point_of_sales/app/views/views/price_field_view.dart';

class AddProductView extends GetView {
  final ProductController controller;
  const AddProductView({super.key, required this.controller});
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
                'Add Product',
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
                      AddImageView(callBack: () {}),
                      SizedBox(height: 20),
                      DefaultFieldView(
                        label: 'Product Name',
                        hint: 'Product Name',
                        controller: controller.productNameController,
                      ),
                      SizedBox(height: 20),
                      PriceFieldView(
                        controller: controller.productPriceController,
                        label: 'Price',
                        hint: 'Price',
                      ),
                      SizedBox(height: 20),
                      CategoryPickerView(controller: controller),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 0,
                  left: 0,
                  child: DefaultButton(
                    text: 'Add Product',
                    onPress: () => controller.addProduct(),
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
