import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class FoundController extends GetxController {
  RxString selectCurrency = "USD".obs;
  RxString amount = "".obs;
  RxInt amountLength = 0.obs;

  List<String> currencyList = ["USD", "AUD"];

  void onPresedbackToHome() {
    Get.offAllNamed(Routes.bottomNavBarScreen);
  }
}
