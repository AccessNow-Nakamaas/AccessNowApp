import 'package:get/get.dart';
import 'package:qrpay/views/bottom_navbar/dashboard_screen.dart';

import '../../views/bottom_navbar/notification_screen.dart';

class BottomNavBarController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final List page = [
    DashBordScreen(),
   const NotificationScreen()
  ];
  void selectedPage(int index) {
    selectedIndex.value = index;
  }

  void onPressedMidIcon() {
  //  Get.toNamed(Routes.petSelectingScreen);
  }

  void onPressedNotification() {
    // Get.toNamed(Routes.notificationScreen);
  }

  void onPressedMenuIcon() {}
  
  
}