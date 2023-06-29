import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class MoneyTransferController extends GetxController {
  final qrAddressController = TextEditingController();
  final amountController = TextEditingController();

  RxString selectCurrency = "USD".obs;
  RxDouble fee = 2.00.obs;
  RxDouble min = 10.00.obs;
  RxDouble max = 10000.00.obs;

  List<String> currencyList = ["USD", "AUD"];

  void onpresedSend() {
    Get.toNamed(Routes.previewScreen);
  }
}
