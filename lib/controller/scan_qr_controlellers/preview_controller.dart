import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class PreviewController extends GetxController{
  void onPresedbackToHome() {
    Get.offAllNamed(Routes.bottomNavBarScreen);
  }
  
}