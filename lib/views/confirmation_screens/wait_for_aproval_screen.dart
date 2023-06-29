import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';
import '../../../utils/strings.dart';
import '../../routes/routes.dart';
import '../../utils/assets.dart';
import '../../widgets/button_widget/primary_button.dart';

class WaitForApprovalScreen extends StatelessWidget {
  WaitForApprovalScreen({Key? key}) : super(key: key);
  final congratulationData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: mainCenter,
      children: [
        _congratulationImg(context),
        _titleWidget(context),
        _okayButtonWidget(context)
      ],
    );
  }

  _congratulationImg(BuildContext context) {
    return Image.asset(
      Assets.warn,
      height: MediaQuery.of(context).size.height * 0.19,
      width: MediaQuery.of(context).size.height * 0.19,
    );
  }

  _titleWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize * 1.7),
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.6),
      child: Column(
        children: [
          Text(
            Strings.waitApproval,
            textAlign: TextAlign.center,
            style: CustomStyle.boldTitleTextStyle,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.7),
          Text(
            Strings.waitForYourSubmitted,
            textAlign: TextAlign.center,
            style: CustomStyle.defaultSubTitleTextStyle,
          ),
        ],
      ),
    );
  }

  _okayButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize * 1.3,
      ),
      alignment: Alignment.centerRight,
      child: PrimaryButtonWidget(
        text: Strings.okay,
        onPressed: () {
          Get.offAllNamed(Routes.signInOptionsScreen);
        },
      ),
    );
  }
}
