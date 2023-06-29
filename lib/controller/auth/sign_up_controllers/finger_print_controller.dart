
import 'package:get/get.dart';
import '../../../routes/routes.dart';

class FingerPrintColotroller extends GetxController {
  void onPressedSkipNow() {
    Get.offAllNamed(Routes.signInOptionsScreen);
  }

  void onPressedConfirm() {
    Get.toNamed(Routes.facelockScreen);
  }
}
