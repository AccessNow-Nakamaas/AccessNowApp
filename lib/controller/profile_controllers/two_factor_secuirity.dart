import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class TwoFactorSecuirityController extends GetxController {
  final emailAddressController = TextEditingController();

  @override
  void dispose() {
    emailAddressController.dispose();
    super.dispose();
  }

  void onTapSenVerificationCode() {
    Get.toNamed(Routes.twoFactorOtpScreen);
  }
}
