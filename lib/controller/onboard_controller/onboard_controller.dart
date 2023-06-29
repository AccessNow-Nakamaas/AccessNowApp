import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:qrpay/routes/routes.dart';

class OnboardController extends GetxController {
  final liquidController = LiquidController();

  RxInt currentPage = 0.obs;
  pageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  void onTapSkip() {
    Get.offAllNamed(Routes.signUpScreen);
  }

  void onTapIcon() {
    Get.offAllNamed(Routes.signUpScreen);
  }

  // pageNavigate() {
  //   Get.toNamed(Routes.signUpScreen);
  // }

  // animatedNextSlide() {
  //   int nextPage = liquidController.currentPage + 1;
  //   liquidController.animateToPage(page: nextPage);
  // }
}
