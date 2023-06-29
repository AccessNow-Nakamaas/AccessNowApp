import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../controller/profile_controllers/profile_controller.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/size.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.profile),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        _userImgTextWidget(context),
        _selectedTileWidget(context),
        _unselectedTileWidget(context),
      ],
    );
  }

  _userImgTextWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize * 2,
          vertical: Dimensions.defaultPaddingSize * 1.5),
      child: Column(
        children: [
          Container(
            height: Dimensions.heightSize * 10,
            width: Dimensions.widthSize * 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              color: CustomColor.draweBackGround,
              border: Border.all(color: CustomColor.primaryColor, width: 5),
            ),
            child: Image.asset(
              Assets.profile,
              fit: BoxFit.cover,
            ),
          ),
          addVerticalSpace(Dimensions.heightSize * 1.5),
          Text(
            Strings.colnelArichart,
            style: GoogleFonts.inter(
              fontSize: Dimensions.marginSize,
              fontWeight: FontWeight.w700,
              color: CustomColor.primaryTextColor,
            ),
          ),
          Text(
            Strings.colnelGmail,
            style: GoogleFonts.inter(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w500,
              color: CustomColor.thirdTextColor,
            ),
          ),
          addVerticalSpace(Dimensions.heightSize * 2)
        ],
      ),
    );
  }

  _selectedTileWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: Dimensions.defaultPaddingSize * 2),
          height: Dimensions.heightSize * 4,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: CustomColor.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(Dimensions.radius * 3),
                topRight: Radius.circular(Dimensions.radius * 3),
              )),
          child: Row(
            mainAxisAlignment: mainEnd,
            children: [
              SvgPicture.asset(
                Assets.mywallet,
                // ignore: deprecated_member_use
                color: CustomColor.primaryColor,
              ),
              addHorizontalSpace(
                Dimensions.widthSize * 3,
              ),
             GestureDetector (
              onTap: (){
                controller.onTapMyWallet();
              },
                child: Text(
                  Strings.myWallet,
                  style: CustomStyle.profileTextStyle,
                ),
              ),
              addHorizontalSpace(Dimensions.widthSize * 6),
              SvgPicture.asset(Assets.forwad),
              addHorizontalSpace(
                Dimensions.widthSize,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _unselectedTileWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSize * 1.8,
          vertical: Dimensions.marginSize * 0.4),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.updateProfile,
                // ignore: deprecated_member_use
                color: CustomColor.primaryColor,
              ),
              addHorizontalSpace(Dimensions.widthSize * 3),
               GestureDetector (
              onTap: (){
                controller.onTapUpdateProfile();
              },
                child: Text(
                  Strings.updateProfile,
                  style: CustomStyle.profileTextStyle,
                ),
              ),
            ],
          ),
          addVerticalSpace(Dimensions.heightSize*1.5),
          Row(
            children: [
              SvgPicture.asset(
                Assets.updatekycForm,
                // ignore: deprecated_member_use
                color: CustomColor.primaryColor,
              ),
              addHorizontalSpace(Dimensions.widthSize * 3),
              GestureDetector (
              onTap: (){
                controller.onTapUpdateKyc();
              },
                child: Text(
                  Strings.updateKYC,
                  style: CustomStyle.profileTextStyle,
                ),
              ),
            ],
          ),
                   addVerticalSpace(Dimensions.heightSize*1.5),
          Row(
            children: [
              SvgPicture.asset(
                Assets.twoFaSecurit,
                // ignore: deprecated_member_use
                color: CustomColor.primaryColor,
              ),
              addHorizontalSpace(Dimensions.widthSize * 3),
              GestureDetector (
              onTap: (){
                controller.onTap2FactorSecuirity();
              },
                child: Text(
                  Strings.fA2Security,
                  style: CustomStyle.profileTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
