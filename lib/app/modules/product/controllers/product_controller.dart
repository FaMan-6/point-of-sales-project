import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sales/app/controllers/session_controller.dart';

import 'package:point_of_sales/app/data/services/category_services.dart';
import 'package:point_of_sales/app/data/services/product_services.dart';
import 'package:point_of_sales/app/views/views/add_category_view.dart';
import 'package:point_of_sales/app/views/views/add_product_view.dart';

class ProductController extends GetxController {
  final CategoryServices categoryServices = CategoryServices();
  final ProductServices productServices = ProductServices();
  TextEditingController searchController = TextEditingController();
  final isEditorOpen = false.obs;
  final editorMode = ''.obs;
  final categoryNameController = TextEditingController();

  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();
  final selectedCategoryId = (-1).obs;

  final categories = [].obs;
  final products = [].obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Category functions start
  Future<void> addCategory() async {
    final response = await categoryServices.addCategory(
      categoryNameController.text,
      Get.find<SessionController>().storeId.value,
    );
    if (response) {
      ScaffoldMessenger.of(
        Get.context!,
      ).showSnackBar(SnackBar(content: Text('Category Added')));
      closeEditor();
    }
  }

  Future<void> getCategories() async {
    print('get category function is running...');
    final response = await categoryServices.getCategories(
      Get.find<SessionController>().storeId.value,
    );
    print(response);
    categories.value = response;
  }
  //Category functions end

  //Product functions start
  Future<void> addProduct() async {
    final response = await productServices.addProduct(
      productNameController.text,
      selectedCategoryId.value,
      int.parse(productPriceController.text),
      Get.find<SessionController>().storeId.value,
    );
    if (response) {
      ScaffoldMessenger.of(
        Get.context!,
      ).showSnackBar(SnackBar(content: Text('Product Added')));
      closeEditor();
    }
  }

  Future<void> getProducts() async {
    print('get product function is running...');
    final response = await productServices.getProducts(
      Get.find<SessionController>().storeId.value,
    );
    print(response);
    products.value = response;
  }
  //Product functions end

  //open editor start
  void openCategoryEditor() {
    editorMode.value = 'category';
    isEditorOpen.value = true;
  }

  void openProductEditor() {
    editorMode.value = 'product';
    isEditorOpen.value = true;
  }

  Widget getEditorView() {
    if (editorMode.value == 'category') {
      return AddCategoryView(controller: this);
    } else if (editorMode.value == 'product') {
      return AddProductView(controller: this);
    }
    return const SizedBox();
  }

  void closeEditor() {
    isEditorOpen.value = false;
    clearForm();
  }

  void clearForm() {
    categoryNameController.clear();
    productNameController.clear();
    productPriceController.clear();
    getCategories();
  }

  //open editor end
}
