import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class CardViewController extends GetxController {
  final item = 0.obs;

  final count = 1.obs;

  increment() => count.value++;
  decrease() {
    if (count.value > 1) {
      count.value--;
      if (count.value == 1) {
        item.value--;
      }
    }
  }

  void onPresedbackToHome() {
    Get.offAllNamed(Routes.bottomNavBarScreen);
  }
}
