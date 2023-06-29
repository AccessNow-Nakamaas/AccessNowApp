import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/button_widget/primary_button.dart';
import 'package:qrpay/widgets/input_widget/primary_input_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../../controller/auth/sign_in_controllers/sign_in_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/button_widget/custom_text_button.dart';

final controller = Get.put(SignInController());
final phoneNumberFormKey = GlobalKey<FormState>();

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final signInFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.signIn),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        _logoWidget(context),
        _textWidget(context),
        _inputAndForgotWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _logoWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Dimensions.defaultPaddingSize * 0,
        bottom: Dimensions.defaultPaddingSize * 1,
      ),
      child: Center(
        child: Image.asset(
          Assets.appLogo,
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      ),
    );
  }

  _textWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 1,
        bottom: Dimensions.marginSize * 2,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            Strings.welcomeBackto,
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

  _inputAndForgotWidget(BuildContext context) {
    return Form(
      key: signInFormKey,
      child: Column(
        crossAxisAlignment: crossEnd,
        children: [
          addVerticalSpace(Dimensions.heightSize * 1),
          PrimaryInputWidget(
            controller: controller.passwordController,
            hintText: Strings.enterPassword,
            labelText: Strings.password,
          ),
          addVerticalSpace(
            Dimensions.heightSize * 0.3,
          ),
          InkWell(
            onTap: () => _openDialogue(context),
            child: Text(Strings.forgotPasswordd,
                style: GoogleFonts.inter(
                  fontSize: Dimensions.smallTextSize,
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.w600,
                )),
          )
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize,
        bottom: Dimensions.marginSize,
      ),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          PrimaryButtonWidget(
            text: Strings.continues,
            onPressed: () {
              controller.onTapContinue();
            },
          ),
          addVerticalSpace(Dimensions.heightSize),
          RichText(
            text: TextSpan(
              text: Strings.newQRPay,
              style: GoogleFonts.inter(
                fontSize: Dimensions.mediumTextSize,
                color: CustomColor.primaryTextColor,
                fontWeight: FontWeight.w500,
              ),
              children: [
                WidgetSpan(
                  child: CustomTextButton(
                    onPressed: () {
                      controller.onPressedSignUP();
                    },
                    text: Strings.signUp,
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

_openDialogue(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: CustomColor.whiteColor,
      alignment: Alignment.center,
      insetPadding: EdgeInsets.all(Dimensions.defaultPaddingSize * 0.4),
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Builder(
        builder: (context) {
          var width = MediaQuery.of(context).size.width;
          return Container(
            width: width * 1,
            padding: EdgeInsets.all(Dimensions.defaultPaddingSize * 0.4),
            child: Column(
              mainAxisAlignment: mainCenter,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.marginSize,
                    vertical: Dimensions.defaultPaddingSize * 0.9,
                  ),
                  child: Column(
                    mainAxisAlignment: mainCenter,
                    children: [
                      Text(
                        Strings.forgotPasswordd,
                        textAlign: TextAlign.center,
                        style: CustomStyle.forgotTitleTextStyle,
                      ),
                      addVerticalSpace(Dimensions.heightSize * 0.4),
                      Text(
                        Strings.enterYourPhoneNumber,
                        textAlign: TextAlign.center,
                        style: CustomStyle.forgotSubTitleTextStyle,
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(
                  Dimensions.heightSize * 0.6,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.marginSize * 0.8,
                    bottom: Dimensions.marginSize * 0.3,
                  ),
                  child: PrimaryButtonWidget(
                    text: Strings.continues,
                    onPressed: () {
                      Get.toNamed(Routes.signinOTPVerificationScreen);
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    Strings.cancel,
                    style: CustomStyle.resendTextStyle,
                  ),
                ),
                addVerticalSpace(Dimensions.heightSize * 0.2),
              ],
            ),
          );
        },
      ),
    ),
  );
}
