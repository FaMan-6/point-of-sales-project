import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:point_of_sales/app/data/widgets/widgets.dart';
import 'package:point_of_sales/app/modules/home/controllers/home_controller.dart';
import 'package:point_of_sales/app/modules/home/views/home_view.dart';
import 'package:point_of_sales/app/modules/product/controllers/product_controller.dart';
import 'package:point_of_sales/app/modules/product/views/product_view.dart';
import 'package:point_of_sales/app/modules/statistic/controllers/statistic_controller.dart';
import 'package:point_of_sales/app/modules/statistic/views/statistic_view.dart';
import 'package:point_of_sales/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:point_of_sales/app/modules/transaction/views/transaction_view.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(StatisticController());
    Get.put(TransactionController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              color: Theme.of(context).colorScheme.surface,
            ),
            width: 100,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    controller.refresh();
                  },
                  child: SvgPicture.asset(
                    'assets/logo/Subtract.svg',
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuIcon(
                        icon: Icons.home,
                        title: 'Home',
                        controller: controller,
                        index: 0,
                      ),
                      MenuIcon(
                        icon: Icons.inventory,
                        title: 'Product',
                        controller: controller,
                        index: 1,
                      ),
                      MenuIcon(
                        icon: Icons.analytics,
                        title: 'Statistic',
                        controller: controller,
                        index: 2,
                      ),
                      MenuIcon(
                        icon: Icons.receipt,
                        title: 'Sales',
                        controller: controller,
                        index: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  HomeView(),
                  ProductView(),
                  StatisticView(),
                  TransactionView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
