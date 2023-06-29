import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/bottom_navbar_controller/bottom_navbar_controller.dart';
import '../../controller/bottom_navbar_controller/dashboard_controller.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/bottom_navbar_widget/bottom_navbar_widget.dart';
import '../../widgets/drawer_widget/custom_drawer_widget.dart';

final controller = Get.put(DashBoardController());

class BottomNavBarScreen extends StatelessWidget {
  final bottomNavBarController =
      Get.put(BottomNavBarController(), permanent: false);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  BottomNavBarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.dashboard), fit: BoxFit.cover),
        ),
        child: Scaffold(
          drawer: const CustomDrawer(),
          key: scaffoldKey,
          appBar: appbarWidget(context),
          extendBody: true,
          backgroundColor: Colors.transparent,
          bottomNavigationBar: buildBottomNavigationMenu(context, bottomNavBarController),
          floatingActionButton: _midButtonWidget(context),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: bottomNavBarController
              .page[bottomNavBarController.selectedIndex.value],
        ),
      ),
    );
  }

  _midButtonWidget(BuildContext context) {
    return CircleAvatar(
      radius: 45,
      backgroundColor: CustomColor.whiteColor,
      child: CircleAvatar(
          radius: 40,
          backgroundColor: CustomColor.primaryColor.withOpacity(0.4),
          child: CircleAvatar(
            radius: 36,
            backgroundColor: CustomColor.primaryColor,
            child: InkWell(
              onTap: () {
                controller.onPresedQRScan();
              },
              child: SvgPicture.asset(
                Assets.scanqr,
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          )),
    );
  }

  appbarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: bottomNavBarController.selectedIndex.value == 0
          ? Colors.transparent
          : CustomColor.whiteColor,
      elevation: bottomNavBarController.selectedIndex.value == 0 ? 0 : 3,
      centerTitle:
          bottomNavBarController.selectedIndex.value == 0 ? true : false,
      leading: bottomNavBarController.selectedIndex.value == 0
          ? InkWell(
              onTap: () {
                bottomNavBarController.onPressedMenuIcon();
              },
              child: InkWell(
                onTap: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.defaultPaddingSize,
                      right: Dimensions.defaultPaddingSize * 0.2),
                  child: SvgPicture.asset(Assets.menu,
                      // ignore: deprecated_member_use
                      height: 13, width: 17, color: CustomColor.whiteColor),
                ),
              ),
            )
          : Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Dimensions.marginSize * 0.1),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize*0.8),
                child: GestureDetector(
                    onTap: (){
                      bottomNavBarController.selectedIndex.value = 0;
                    },
                    child:SvgPicture.asset(Assets.backward,height: Dimensions.heightSize,)
                ),
              ),
            ),
      title: bottomNavBarController.selectedIndex.value == 0
          ? Padding(
              padding: EdgeInsets.all(Dimensions.defaultPaddingSize * 1.2),
              child: const Text(
                Strings.qrpay,
              ))
          : Text(
              Strings.notification,
              style: CustomStyle.forgotTitleTextStyle,
            ),
      actions: [
        bottomNavBarController.selectedIndex.value == 0
            ? Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.defaultPaddingSize * 0.2,
                    right: Dimensions.defaultPaddingSize * 0.6),
                child: InkWell(
                  onTap: () {
                    controller.onTapProfile();
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: CustomColor.primaryColor.withOpacity(0.2),
                    child: Image.asset(Assets.profile),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
