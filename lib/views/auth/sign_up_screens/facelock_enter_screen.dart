import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qrpay/controller/auth/sign_up_controllers/entered_faceloack_controller.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/button_widget/primary_button.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../../controller/auth/sign_up_controllers/facelock_capture_controller.dart';
import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';

final controller = Get.put(EnteredFacelockController());

class FacelockEnterScreen extends StatelessWidget {
  FacelockEnterScreen({super.key});
  final controller = Get.put(FacelockColotroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.facelock),
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
          Strings.facelockAuthentication,
          style: CustomStyle.boldTitleTextStyle,
        ),
        Text(
          Strings.useFacelockSystem,
          style: CustomStyle.defaultSubTitleTextStyle,
        ),
      ],
    );
  }

  _imgWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSize * 3.5,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(Dimensions.marginSize * 0.3),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xff6ae792),
                  width: 3.0,
                ),
                bottom: BorderSide(
                  color: Color(0xff6ae792),
                  width: 3.0,
                ),
              ),
              image: DecorationImage(
                  image: AssetImage(
                    Assets.person1,
                  ),
                  fit: BoxFit.cover),
            ),
            child: GestureDetector(
              onTap: () {
                _openImageSourceOptions(context);
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: CustomColor.blackColor.withOpacity(0.5),
                child: SvgPicture.asset(
                  Assets.camera,
                  height: 18,
                ),
              ),
            ),
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
            controller.onPressedconfirm();
          },
        ),
        addVerticalSpace(
          Dimensions.heightSize * 2,
        ),
        InkWell(
          onTap: () {
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

_openImageSourceOptions(BuildContext context) {
  showGeneralDialog(
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: Dimensions.heightSize * 13,
              width: Dimensions.widthSize * 25,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.camera_alt,
                          size: 40.0,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          controller.chooseFromCamera();
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        'from Camera',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.smallTextSize),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.photo,
                          size: 40.0,
                          color: Colors.green,
                        ),
                        onTap: () {
                          controller.chooseFromGallery();
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        'From Gallery',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.smallTextSize),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      });
}
