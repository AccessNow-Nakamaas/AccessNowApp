import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/controller/auth/sign_up_controllers/sign_up_controller.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/button_widget/primary_button.dart';

import '../../../utils/custom_color.dart';
import '../../../widgets/button_widget/custom_text_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyWidget(context));
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _logoWidget(context),
        _textWidget(context),
        _inputFieldWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _logoWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize * 0),
      child: Center(
        child: Image.asset(
          Assets.appLogo,
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      ),
    );
  }

  _textWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 0,
        bottom: Dimensions.marginSize * 2,
      ),
      padding: EdgeInsets.only(
        left: Dimensions.defaultPaddingSize * 0.9,
        right: Dimensions.defaultPaddingSize * 2,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            Strings.welcometo,
            style: CustomStyle.welcomeTOTextTitle,
          ),
          addVerticalSpace(
            Dimensions.heightSize * 0.5,
          ),
          Text(
            Strings.qrpay,
            style: CustomStyle.welcomeTitleTextTitle,
          ),
          addVerticalSpace(
            Dimensions.heightSize,
          ),
          Text(
            Strings.useSecureInstant,
            style: CustomStyle.defaultTitleTextTitle,
          ),
        ],
      ),
    );
  }

  _inputFieldWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize * 0.6,
          vertical: Dimensions.defaultPaddingSize * 0.3),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.defaultPaddingSize * 0.8,
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      child: Column(
        children: [
          PrimaryButtonWidget(
            text: Strings.continues,
            onPressed: () {
              controller.onPressedContinue();
            },
          ),
          addVerticalSpace(Dimensions.heightSize * 2),
          RichText(
            text: TextSpan(
              text: Strings.alreadyHaveAnAccount,
              style: GoogleFonts.inter(
                fontSize: Dimensions.mediumTextSize,
                color: CustomColor.primaryTextColor,
                fontWeight: FontWeight.w400,
              ),
              children: [
                WidgetSpan(
                  child: CustomTextButton(
                    onPressed: () {
                      controller.onPressedSignIn();
                    },
                    text: Strings.signIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
