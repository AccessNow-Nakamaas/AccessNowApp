import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:qrpay/widgets/onboard_widget/onboard_widget.dart';
import '../../controller/onboard_controller/onboard_controller.dart';
import '../../data/onbaord_data.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

final controller = Get.put(OnboardController());

class OnboardSceen extends StatelessWidget {
  const OnboardSceen({super.key});

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.currentPage.value) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    debugPrint(zoom.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 25.0,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: controller.liquidController.currentPage == index
                  ? controller.liquidController.currentPage == 0
                    ? CustomColor.blackColor
                    : CustomColor.whiteColor
                  : Colors.transparent,
              border: Border.all(
                color: controller.liquidController.currentPage == 0
                    ? CustomColor.blackColor
                    : CustomColor.whiteColor
              )
            ),
            child: const SizedBox(
              width: 8.0 * 2,
              height: 8.0 * 2,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return Stack(
        children: <Widget>[
          LiquidSwipe.builder(
            itemCount: onboardData.length,
            itemBuilder: (context, index) => OnboardWidget(
              titleColor: controller.liquidController.currentPage == 0
                  ? CustomColor.primaryTextColor
                  : CustomColor.whiteColor,
              subTitleColor: controller.liquidController.currentPage == 0
                  ? CustomColor.thirdTextColor
                  : CustomColor.whiteColor.withOpacity(0.7),
              detailsColor: controller.liquidController.currentPage == 0
                  ? CustomColor.primaryTextColor
                  : CustomColor.whiteColor.withOpacity(0.7),
              img: onboardData[index].img,
              text1: onboardData[index].text1,
              text2: onboardData[index].text2,
              text3: onboardData[index].text3,
              bgColor: onboardData[index].bgColor,
            ),
            positionSlideIcon: 0.65,
            slideIconWidget: InkWell(
              onTap: () {
                controller.onTapIcon();
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: controller.liquidController.currentPage == 2
                    ? Colors.black
                    : CustomColor.whiteColor,
                child: CircleAvatar(
                  backgroundColor: controller.liquidController.currentPage == 0
                      ? CustomColor.primaryColor
                      : controller.liquidController.currentPage == 2
                        ? Colors.white
                        : const Color(0xff5200FF),
                  radius: 15,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: controller.liquidController.currentPage == 2
                        ? Colors.black
                        : CustomColor.whiteColor
                  ),
                ),
              ),
            ),
            onPageChangeCallback: controller.pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: controller.liquidController,
            fullTransitionValue: 880,
            enableSideReveal: true,
            enableLoop: true,
            ignoreUserGestureWhileAnimating: true,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.defaultPaddingSize * 17,
              right: Dimensions.defaultPaddingSize * 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(onboardData.length, _buildDot),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize * 1.8,
                  left: Dimensions.defaultPaddingSize),
              child: Text(
                Strings.qrpay,
                style: GoogleFonts.inter(
                  fontSize: Dimensions.extraLargeTextSize,
                  fontWeight: FontWeight.w600,
                  color: controller.liquidController.currentPage == 0
                      ? CustomColor.primaryTextColor
                      : CustomColor.whiteColor,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize * 1.8,
                  right: Dimensions.defaultPaddingSize),
              child: InkWell(
                onTap: () {
                  controller.onTapSkip();
                },
                child: Text(
                  Strings.skip,
                  style: GoogleFonts.inter(
                    fontSize: Dimensions.smallTextSize,
                    fontWeight: FontWeight.w500,
                    color: controller.liquidController.currentPage == 0
                        ? CustomColor.primaryTextColor
                        : CustomColor.whiteColor,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }));
  }
}
