import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class VirtualCardController extends GetxController {
  void onTapDetails() {
    Get.toNamed(Routes.detailsScreen);
  }

  void onTapFound() {
    Get.toNamed(Routes.foundScreen);
  }

  void onTapTransaction() {
    Get.toNamed(Routes.transactionScreen);
  }
}
