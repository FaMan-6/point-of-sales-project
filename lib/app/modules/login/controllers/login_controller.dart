import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sales/app/data/services/login_services.dart';
import 'package:point_of_sales/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final storeNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final loginServices = LoginServices();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        final response = await loginServices.login(
          storeNameController.text,
          passwordController.text,
        );
        if (response) {
          getStore();
        } else {
          ScaffoldMessenger.of(
            Get.context!,
          ).showSnackBar(SnackBar(content: Text('Login Failed')));
        }
      } catch (e) {
        print('controller error: $e');
        ScaffoldMessenger.of(
          Get.context!,
        ).showSnackBar(SnackBar(content: Text('Login Failed')));
      }
    }
  }

  Future<void> getStore() async {
    try {
      final response = await loginServices.getStore(storeNameController.text);
      if (response.id != 0) {
        Get.offAllNamed(Routes.MAIN);
      } else {
        ScaffoldMessenger.of(
          Get.context!,
        ).showSnackBar(SnackBar(content: Text('Failed to load store')));
      }
    } catch (e) {
      print('controller error: $e');
      ScaffoldMessenger.of(
        Get.context!,
      ).showSnackBar(SnackBar(content: Text('Failed to load store')));
    }
  }

  void forgotPassword() {
    ScaffoldMessenger.of(
      Get.context!,
    ).showSnackBar(SnackBar(content: Text('Forgot Password')));
  }
}
