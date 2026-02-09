import 'package:get/get.dart';

class SessionController extends GetxController {
  //TODO: Implement SessionController
  final storeId = RxInt(0);
  final storeName = ''.obs;

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

  void storeSession(int id, String name) {
    storeId.value = id;
    storeName.value = name;
  }

  void removeSession() {
    storeId.value = 0;
    storeName.value = '';
  }
}
