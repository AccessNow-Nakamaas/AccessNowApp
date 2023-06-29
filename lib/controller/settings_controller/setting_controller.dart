import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class SettingController extends GetxController {


 RxBool fingerprint=false.obs;
 RxBool facelock=false.obs;

  RxString selectLanguage = 'English'.obs;

  List<String> languageList = ['English', 'Bangla'];

  void onTapChangePassword() {
    Get.toNamed(Routes.changePasswordScreen);
  }
}
