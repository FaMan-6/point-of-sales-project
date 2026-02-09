import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:point_of_sales/app/controllers/session_controller.dart';
import 'package:point_of_sales/app/views/views/employee_picker_view.dart';
import 'package:point_of_sales/app/views/views/search_field_view.dart';
import 'package:point_of_sales/app/views/views/transaction_card_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final sessionController = Get.find<SessionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchFieldView(
                  controller: controller.searchController,
                  hintText: 'Search menu here',
                ),
                SizedBox(
                  width: 200,
                  child: EmployeePickerView(
                    employees: controller.dataEmployee,
                    onChanged: (value) {
                      print(value);
                      controller.selectedEmployeeId.value = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [TransactionCardView()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
