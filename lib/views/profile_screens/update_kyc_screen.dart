import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/controller/profile_controllers/update_kyc_controller.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/size.dart';

final controller = Get.put(UpdateKycController());

class UpdateKycScreen extends StatelessWidget {
  const UpdateKycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.updateKYC),
      bottomSheet: _bottomSheetWidget(context),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.4,
        vertical: Dimensions.defaultPaddingSize * 0.6,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Expanded(
                child: DottedBorder(
                  dashPattern: const [6, 4],
                  strokeWidth: 2,
                  color: CustomColor.borderColor,
                  child: SizedBox(
                    height: Dimensions.heightSize * 8.3,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.idcard),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _openImageSourceOptions(context);
                            },
                            child: SvgPicture.asset(
                              Assets.camera,
                              height: Dimensions.heightSize * 1.4,
                            ),
                          ),
                        ),
                        const Positioned(
                          right: 5,
                          top: 15,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: Color(0xff00B654),
                            child: Icon(
                              Icons.check,
                              color: CustomColor.whiteColor,
                              size: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              addHorizontalSpace(
                Dimensions.widthSize,
              ),
              Expanded(
                child: DottedBorder(
                  color: CustomColor.borderColor,
                  dashPattern: const [8, 4],
                  strokeWidth: 2,
                  child: SizedBox(
                    height: Dimensions.heightSize * 8.3,
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Assets.idcard),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _openImageSourceOptions(context);
                              },
                              child: SvgPicture.asset(
                                Assets.camera,
                                height: Dimensions.heightSize * 1.4,
                              ),
                            ),
                          ),
                          const Positioned(
                            right: 5,
                            top: 15,
                            child: CircleAvatar(
                              radius: 11,
                              backgroundColor: Color(0xff00B654),
                              child: Icon(
                                Icons.check,
                                color: CustomColor.whiteColor,
                                size: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          addVerticalSpace(
            Dimensions.heightSize * 0.5,
          ),
          Text(
            Strings.uploadPassportNidDri,
            style: CustomStyle.smallestTExtStyle,
          ),
          addVerticalSpace(Dimensions.heightSize)
        ],
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
        controller.onTapUpdateKyc();
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
              Strings.updateKYC,
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
