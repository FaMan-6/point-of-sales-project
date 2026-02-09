import 'package:get/get.dart';
import 'package:point_of_sales/app/controllers/session_controller.dart';
import 'package:point_of_sales/app/modules/home/controllers/home_controller.dart';
import 'package:point_of_sales/app/modules/product/controllers/product_controller.dart';

class MainController extends GetxController {
  final sessionController = Get.find<SessionController>();

  final tabIndex = 0.obs;

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

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void refresh() {
    print('refreshing...');
    Get.find<ProductController>().getCategories();
    Get.find<ProductController>().getProducts();
    Get.find<HomeController>().getEmployee();
  }
}
