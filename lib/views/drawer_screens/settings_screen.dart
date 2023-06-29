import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/controller/settings_controller/setting_controller.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../utils/custom_color.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final controller = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.settings),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          _changePasswordText(context),
          _lockWidget(context),
          _changeLanguageWidget(context),
        ],
      );
    });
  }

  _changePasswordText(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.marginSize * 0.7,
            horizontal: Dimensions.marginSize * 1.3,
          ),
          child: GestureDetector(
            onTap: () {
              controller.onTapChangePassword();
            },
            child: Text(
              Strings.changePassword,
              style: CustomStyle.settingTextStyle,
            ),
          ),
        ),
        const Divider(
          height: 2,
          color: Color(0xffE0E0E0),
        )
      ],
    );
  }

  _lockWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.marginSize * 0.3,
            horizontal: Dimensions.marginSize * 1.3,
          ),
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Text(
                Strings.fingerprint,
                style: CustomStyle.settingTextStyle,
              ),
              Switch(
                value: controller.fingerprint.value,
                onChanged: ((value) {
                  controller.fingerprint.toggle();
                }),
              )
            ],
          ),
        ),
        const Divider(
          height: 2,
          color: Color(0xffE0E0E0),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.marginSize * 0.3,
            horizontal: Dimensions.marginSize * 1.3,
          ),
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Text(
                Strings.facelock,
                style: CustomStyle.settingTextStyle,
              ),
              Switch(
                value: controller.facelock.value,
                onChanged: ((value) {
                  controller.facelock.toggle();
                }),
              )
            ],
          ),
        ),
        const Divider(
          height: 2,
          color: Color(0xffE0E0E0),
        ),
      ],
    );
  }

  _changeLanguageWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.marginSize * 0.2,
            horizontal: Dimensions.marginSize * 1.3,
          ),
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Text(
                Strings.changeLanguage,
                style: CustomStyle.settingTextStyle,
              ),
              Obx(() {
                return DropdownButton(
                  hint: Text(controller.selectLanguage.value,
                      style: GoogleFonts.inter(
                        fontSize: Dimensions.smallTextSize,
                        color: CustomColor.blackColor,
                        fontWeight: FontWeight.w500,
                      )),
                  iconEnabledColor: CustomColor.blackColor,
                  dropdownColor: CustomColor.whiteColor,
                  underline: Container(height: 0),
                  items: controller.languageList
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          color: controller.selectLanguage.value == value
                              ? CustomColor.primaryColor
                              : CustomColor.primaryTextColor,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    controller.selectLanguage.value = value!;
                  },
                );
              }),
            ],
          ),
        ),
        const Divider(
          height: 2,
          color: Color(0xffE0E0E0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.defaultPaddingSize * 0.4,
            horizontal: Dimensions.defaultPaddingSize,
          ),
          child: Text(
            Strings.deleteAccount,
            style: CustomStyle.settingTextStyle,
          ),
        ),
      ],
    );
  }
}
