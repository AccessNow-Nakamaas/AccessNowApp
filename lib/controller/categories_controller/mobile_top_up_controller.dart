import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class MobileTopUpController extends GetxController{

  final mobileTopUpTypeController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final amountController = TextEditingController();

  RxDouble fee = 2.0.obs;
  RxDouble amount = 0.0.obs;
  RxString mobileNumber = ''.obs;
  RxBool isVisible = false.obs;

  @override
  void dispose() {
    mobileTopUpTypeController.dispose();
    mobileNumberController.dispose();
    amountController.dispose();
    super.dispose();
  }

  RxString selectCurrency = "USD".obs;

  List<String> currencyList = ["USD", "AUD"];

  RxString topUPMethod = "AT&T Mobility".obs;

  List<String> topUpList = [
    "AT&T Mobility",
    "AT&T Mobility2",
   
  ];

  void onPresedbackToHome() {
    Get.toNamed(Routes.bottomNavBarScreen);
  }
}