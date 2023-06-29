import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../controller/profile_controllers/two_factor_secuirity.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/size.dart';
import '../../widgets/input_widget/primary_input_widget.dart';

final controller = Get.put(TwoFactorSecuirityController());

class TwoFactorSecuirityScreen extends StatelessWidget {
  TwoFactorSecuirityScreen({super.key});
  final controller = Get.put(TwoFactorSecuirityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings.fA2Security,
      ),
      bottomSheet: _bottomSheetWidget(context),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: Dimensions.defaultPaddingSize * 3),
      children: [
        _congratulationImg(context),
        _titleWidget(context),
        _okayButtonWidget(context)
      ],
    );
  }

  _congratulationImg(BuildContext context) {
    return Image.asset(
      Assets.twoFaSecurity,
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
            Strings.enable2FASecurity,
            textAlign: TextAlign.center,
            style: CustomStyle.boldTitleTextStyle,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.7),
          Text(
            Strings.weAskForVerification,
            textAlign: TextAlign.justify,
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
      child: PrimaryInputWidget(
        controller: controller.emailAddressController,
        hintText: Strings.enterEmailAddress,
        labelText: Strings.emailAddress,
      ),
    );
  }
}

_bottomSheetWidget(BuildContext context) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Dimensions.radius * 2),
        topRight: Radius.circular(Dimensions.radius * 2),
      ),
    ),
    margin: EdgeInsets.zero,
    child: InkWell(
      onTap: () {
        controller.onTapSenVerificationCode();
      },
      child: Container(
        padding: EdgeInsets.only(
          top: Dimensions.defaultPaddingSize * 1.2,
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
          bottom: Dimensions.marginSize,
        ),
        height: Dimensions.heightSize * 8,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: CustomColor.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius * 2),
              topRight: Radius.circular(Dimensions.radius * 2),
            )),
        child: Container(
          height: Dimensions.heightSize * 4.2,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
            color: CustomColor.primaryColor,
          ),
          child: Center(
            child: Text(
              Strings.sendVerificationCode,
              style: GoogleFonts.inter(
                fontSize: Dimensions.extraLargeTextSize,
                color: CustomColor.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
