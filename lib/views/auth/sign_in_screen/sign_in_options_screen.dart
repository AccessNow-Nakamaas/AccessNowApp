import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../../controller/auth/sign_in_controllers/sign_in_controller.dart';
import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/button_widget/custom_text_button.dart';

class SignInOptionsScreen extends StatelessWidget {
  SignInOptionsScreen({super.key});
  final controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.signIn),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _logoWidget(context),
        _textWidget(context),
        _fingerORfaceWidget(context),
        _textButtonWidget(context),
      ],
    );
  }

  _logoWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Dimensions.defaultPaddingSize * 0,
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
        top: Dimensions.marginSize * 3,
        bottom: Dimensions.marginSize * 3,
      ),
      padding: EdgeInsets.only(
        left: Dimensions.defaultPaddingSize * 0.9,
        right: Dimensions.defaultPaddingSize * 2,
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

  _fingerORfaceWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize * 3),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          SvgPicture.asset(
            Assets.fingerlock,
            height: Dimensions.heightSize * 4,
            width: Dimensions.widthSize * 6,
          ),
          Text(
            Strings.or,
            style: CustomStyle.defaultSubTitleTextStyle,
          ),
          SvgPicture.asset(
            Assets.facelock,
            height: Dimensions.heightSize * 4,
            width: Dimensions.widthSize * 6,
          ),
        ],
      ),
    );
  }

  _textButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize * 5),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: mainCenter,
        children: [
          RichText(
            text: TextSpan(
              text: Strings.signInWith,
              style: GoogleFonts.inter(
                fontSize: Dimensions.mediumTextSize,
                color: CustomColor.primaryTextColor,
                fontWeight: FontWeight.w400,
              ),
              children: [
                WidgetSpan(
                  child: CustomTextButton(
                    onPressed: () {
                      controller.onPressedPassword();
                    },
                    text: Strings.password,
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
