import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class BillPayController extends GetxController {
  final bilTypeController = TextEditingController();
  final bilNumberController = TextEditingController();
  final amountController = TextEditingController();

  RxString bilNumber = ''.obs;
  RxDouble amount = 0.0.obs;
  RxDouble charge = 2.0.obs;
  RxBool isVisible = false.obs;

  @override
  void dispose() {
    bilTypeController.dispose();
    bilNumberController.dispose();
    amountController.dispose();
    super.dispose();
  }

  RxString selectCurrency = "USD".obs;

  List<String> currencyList = ["USD", "AUD"];

  RxString billCategoryMethod = "Electicity".obs;

  List<String> billCategoryList = [
    "Electicity",
    "Gas",
    "Water",
    "Internet",
    "Telephone",
    "TV",
    "Education",
    "Govt.Fees",
    "Insurance",
    "Others",
  ];

  void onPresedbackToHome() {
    Get.offAllNamed(Routes.bottomNavBarScreen);
  }
}
