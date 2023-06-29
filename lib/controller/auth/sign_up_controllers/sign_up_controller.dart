import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class SignUpController extends GetxController {
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  RxString countryCode = '+1'.obs;
  RxString countryName = 'United States'.obs;
  void onPressedContinue() {
    Get.toNamed(Routes.otpVerificationScreen);
  }

  void onPressedSignIn() {
    Get.toNamed(Routes.signInOptionsScreen);
  }
}
