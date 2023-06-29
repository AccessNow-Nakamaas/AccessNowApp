import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class SignInController extends GetxController {
  final countryPhoneController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    countryPhoneController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onPressedPassword() {
    Get.toNamed(Routes.signInScreen);
  }

  void onPressedSignUP() {
    Get.toNamed(Routes.signUpScreen);
  }

  void onPresedEdit() {}

  void onTapContinue() {
    Get.offAllNamed(Routes.bottomNavBarScreen);
  }
}
