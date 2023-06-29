import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class ScanQRController extends GetxController {
  void onPresedEdit() {
    Get.toNamed(Routes.moneyTransferScreen);
  }

  void onPresedScaner() {
    Get.toNamed(Routes.moneyTransferScreen);
  }
}
