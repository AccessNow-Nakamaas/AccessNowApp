import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/strings.dart';

class ResetPasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void onPressedResetPass() {
    Get.toNamed(
      Routes.congratulationScreen,
      arguments: {
        "isCongratulation": true,
        "subtitle": Strings.yourPasswordHasBeen,
        "routes": Routes.signUpScreen,
      },
    );
  }
}
