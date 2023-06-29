import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/auth/sign_up_controllers/otp_controller.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';
import '../../../utils/strings.dart';
import '../../../widgets/button_widget/primary_button.dart';
import '../../../widgets/input_widget/otp_input_widget.dart';
import '../../../widgets/others/custom_appbar.dart';

class SigninOTPVerificationScreen extends StatelessWidget {
  SigninOTPVerificationScreen({super.key});
  final controller = Get.put(OtpVerificationController());
  final otpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.oTPVerification),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.7),
      children: [
        _otpTextWidget(context),
        _inputWidget(context),
        _timerWidget(context),
        _submitButtonWidget(context),
      ],
    );
  }

  _otpTextWidget(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: Dimensions.marginSize * 3),
            child: Text(
              Strings.oTPVerification,
              style: CustomStyle.boldTitleTextStyle,
            )),
        addVerticalSpace(Dimensions.heightSize),
        Text(
          Strings.enterYourVerificationCode,
          textAlign: TextAlign.center,
          style: CustomStyle.defaultSubTitleTextStyle,
        ),
        addVerticalSpace(Dimensions.heightSize * 2),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 2,
        bottom: Dimensions.marginSize * 1.1,
      ),
      child: OtpInputTextFieldWidget(
        controller: controller.otpCodeController,
      ),
    );
  }

  _timerWidget(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.access_time_outlined,
            color: CustomColor.primaryColor,
          ),
          SizedBox(width: Dimensions.widthSize * 0.4),
          Text(
            controller.secondsRemaining.value >= 0 &&
                    controller.secondsRemaining.value <= 9
                ? '00:0${controller.secondsRemaining.value}'
                : '00:${controller.secondsRemaining.value}',
            style: GoogleFonts.inter(
              fontSize: Dimensions.smallTextSize,
              color: CustomColor.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _submitButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.mediumTextSize * 3),
      child: Column(
        children: [
          PrimaryButtonWidget(
            text: Strings.submit,
            onPressed: () {
              controller.onPressedSigninOTPSubmit();
            },
          ),
          addVerticalSpace(Dimensions.heightSize * 2),
          Obx(
            () => Visibility(
              visible: controller.enableResend.value,
              child: InkWell(
                onTap: () {
                  controller.resendCode();
                },
                child: Text(
                  Strings.resendCode,
                  style: CustomStyle.resendTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
