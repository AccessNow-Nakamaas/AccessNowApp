import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/button_widget/primary_button.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../controller/auth/sign_up_controllers/finger_print_controller.dart';
import '../../../utils/assets.dart';

class FingerPrintScreen extends StatelessWidget {
   FingerPrintScreen({super.key});
  final controller =Get.put(FingerPrintColotroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.fingerprint),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          _textWidget(context),
          _imgWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _textWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.fingerprintAuthentication,
          style: CustomStyle.boldTitleTextStyle,
        ),
        Text(
          Strings.useFingerPrintSystem,
          style: CustomStyle.defaultSubTitleTextStyle,
        ),
      ],
    );
  }

  _imgWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSize * 3,
      ),
      child: Column(
        children: [
           CircularPercentIndicator(
                      
                  radius: 70.0,
                  lineWidth: 5.0,
                  percent: 0.4,
                  backgroundColor: CustomColor.primaryColor.withOpacity(0.2),
                  center:   SvgPicture.asset(Assets.fingerlock),
                  progressColor: CustomColor.primaryColor,
           ),
          addVerticalSpace(Dimensions.heightSize * 2.4),
          Text(
            Strings.fourtyPercent,
            style: CustomStyle.percentTextStyle,
          ),
          Text(
            Strings.complete,
            style: CustomStyle.priColorTextStyle,
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Column(
      children: [
        PrimaryButtonWidget(
          text: Strings.confirm,
          onPressed: () {
            controller.onPressedConfirm();
          },
        ),
        addVerticalSpace(
          Dimensions.heightSize * 2,
        ),
        InkWell(
          onTap: (){
           controller.onPressedSkipNow();
          },
          child: Text(
            Strings.skipNow,
            style: CustomStyle.resendTextStyle,
          ),
        ),
      ],
    );
  }
}
