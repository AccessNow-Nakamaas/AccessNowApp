import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class FacelockColotroller extends GetxController {
  void onPressedSkipNow() {
    Get.offAllNamed(Routes.signInOptionsScreen);
  }

  void onPressedCapture() {
    Get.toNamed(Routes.facelockEnterScreen);
  }

  void onPressedconfirm() {
    Get.toNamed(Routes.waitForApprovalScreen);
  }
}
