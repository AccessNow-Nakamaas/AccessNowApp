import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qrpay/routes/routes.dart';

import '../../utils/strings.dart';

class TwoFactorOTPController extends GetxController {
  final otpCodeController = TextEditingController();
  bool hasError = false;

  StreamController<ErrorAnimationType>? errorController;

  RxString currentText = "".obs;
  changeCurrentText(value) {
    currentText.value = value;
  }

  @override
  void dispose() {
    otpCodeController.dispose();
    errorController!.close();
    timer?.cancel();
    super.dispose();
  }

  @override
  void onInit() {
    errorController = StreamController<ErrorAnimationType>();
    timerInit();
    super.onInit();
  }

  timerInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining.value != 0) {
        secondsRemaining.value--;
      } else {
        enableResend.value = true;
      }
    });
  }

  RxInt secondsRemaining = 60.obs;
  RxBool enableResend = false.obs;
  Timer? timer;

  resendCode() {
    secondsRemaining.value = 60;
    enableResend.value = false;
    timerInit();
  }

  void onPressedOTPSubmit() {
    Get.toNamed(
      Routes.congratulationScreen,
      arguments: {
        "isCongratulation": true,
        "subtitle": Strings.yourTwoSecurityHAsBeenActive,
        "routes": Routes.bottomNavBarScreen,
      },
    );
  }
}
