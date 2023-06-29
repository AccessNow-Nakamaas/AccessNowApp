import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class ProfileController extends GetxController {
  void onTapMyWallet() {
    Get.toNamed(Routes.myWalletScreen);
  }

  void onTapUpdateProfile() {
    Get.toNamed(Routes.updateProfileScreen);
  }

  void onTapUpdateKyc() {
    Get.toNamed(Routes.updateKycScreen);
  }

  void onTap2FactorSecuirity() {
    Get.toNamed(Routes.twoFactorSecuirityScreen);
  }
}
