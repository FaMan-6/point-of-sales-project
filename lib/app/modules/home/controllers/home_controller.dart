import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sales/app/controllers/session_controller.dart';
import 'package:point_of_sales/app/data/models/employee_model.dart';
import 'package:point_of_sales/app/data/services/employee_services.dart';

class HomeController extends GetxController {
  final employeeService = EmployeeServices();
  final sessionController = Get.find<SessionController>();

  final searchController = TextEditingController();
  final dataEmployee = <EmployeeModel>[].obs;
  final selectedEmployeeId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getEmployee();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getEmployee() async {
    print('get employee function is running...');
    try {
      final data = await employeeService.getEmployees(
        sessionController.storeId.value,
      );
      print(data);
      dataEmployee.assignAll(data);
    } catch (e) {
      print('error: $e');
    }
  }
}
