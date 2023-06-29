import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class DashBoardController extends GetxController {
  void onTabreceiveMoney() {
    Get.toNamed(Routes.moneyReceiveScreen);
  }

  void onTapSend() {
    Get.toNamed(Routes.moneyTransferScreen);
  }

  void onTapRemittance() {
    Get.toNamed(Routes.remittanceScreen);
  }

  void onTapVirtualCard() {
    Get.toNamed(Routes.virtualCardScreen);
  }

  void onTapBillPay() {
    Get.toNamed(Routes.billPayScreen);
  }

  void onTapMobileTopUp() {
    Get.toNamed(Routes.mobileTopUpScreen);
  }

  void onTapBuyGift() {
    Get.toNamed(Routes.buyGiftCardScreen);
  }

  void onTapMyGift() {
    Get.toNamed(Routes.myGiftCardScreen);
  }

  void onPresedQRScan() {
    Get.toNamed(Routes.scanQrScreen);
  }

  void onTapProfile() {
    Get.toNamed(Routes.profileScreen);
  }
}
