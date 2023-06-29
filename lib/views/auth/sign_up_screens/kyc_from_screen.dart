import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/button_widget/primary_button.dart';
import 'package:qrpay/widgets/input_widget/country_picker.dart';
import 'package:qrpay/widgets/input_widget/drop_down_input.dart';
import 'package:qrpay/widgets/input_widget/phone_number_input.dart';
import 'package:qrpay/widgets/input_widget/primary_input_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:qrpay/widgets/others/custom_drop_down.dart';
import '../../../controller/auth/sign_up_controllers/kyc_from_controller.dart';
import '../../../widgets/button_widget/custom_text_button.dart';
import '../../../widgets/input_widget/password_input_widget.dart';

final controller = Get.put(KYCFromController());

class KYCFromScreen extends StatelessWidget {
  KYCFromScreen({super.key});

  final signUpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.kYCForm),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() {
      return ListView(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultPaddingSize * 0.6),
        physics: const BouncingScrollPhysics(),
        children: [
          _inputWidget(context),
          _uploadImageWidget(context),
          _passwordTextInputWIdget(context),
          _buttonWidget(context),
        ],
      );
    });
  }

  _inputWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 0.6,
      ),
      child: Form(
        key: signUpFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: PrimaryInputWidget(
                    controller: controller.firstNameController,
                    hintText: Strings.enterName,
                    labelText: Strings.firstName,
                  ),
                ),
                addHorizontalSpace(Dimensions.widthSize * 2),
                Expanded(
                  child: PrimaryInputWidget(
                    controller: controller.lasstNameController,
                    hintText: Strings.enterName,
                    labelText: Strings.lastName,
                  ),
                ),
              ],
            ),
            addVerticalSpace(
              Dimensions.heightSize,
            ),

            //email address input
            PrimaryInputWidget(
              controller: controller.emailAddressController,
              hintText: Strings.enterEmailAddress,
              labelText: Strings.emailAddress,
            ),
            addVerticalSpace(
              Dimensions.heightSize * 1.5,
            ),
            //number,city zip code
            SignUpCountryCodePickerWidget(
              readOnly: false,
              hintText: controller.signUpController.countryName.value,
              onChanged: (value){
                controller.country.value = value.name;
              },
            ),

            addVerticalSpace(
              Dimensions.heightSize,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownInputWidget(
                    widget: CustomDropDown(
                        itemsList: controller.selectCityList,
                        selectMethod: controller.selectCityMethod),
                   
                    controller: controller.selectCityController,
                    hintText: controller.selectCityMethod.value,
                    labelText: Strings.selectCity,
                  ),
                ),
                addHorizontalSpace(Dimensions.widthSize * 2),
                Expanded(
                  child: PrimaryInputWidget(
                    controller: controller.selectZipController,
                    hintText: Strings.enterCode,
                    labelText: Strings.zipCode,
                  ),
                ),
              ],
            ),
            addVerticalSpace(
              Dimensions.heightSize * 1.5,
            ),
            //phone number code
            PhoneNumberWithCountryCodeInput(
              readOnly: true,
              suffix: SvgPicture.asset(Assets.inputRight),
              controller: controller.phoneNumberController,
              hintText: controller.signUpController.countryCode.value,
              labelText: Strings.phoneNumber,
            ),
            addVerticalSpace(Dimensions.heightSize * 1.5)
          ],
        ),
      ),
    );
  }

  _uploadImageWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: mainCenter,
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
                  child: GestureDetector(
                    onTap: () {
                      _openImageSourceOptions(context);
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: mainCenter,
                        children: [
                          SvgPicture.asset(Assets.frontpart),
                          addVerticalSpace(
                            Dimensions.heightSize * 0.7,
                          ),
                          Text(
                            Strings.frontPart,
                            style: CustomStyle.borderColorText,
                          ),
                        ],
                      ),
                    ),
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
                  child: GestureDetector(
                    onTap: () {
                      _openImageSourceOptions(context);
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: mainCenter,
                        crossAxisAlignment: crossCenter,
                        children: [
                          SvgPicture.asset(Assets.backpart),
                          addVerticalSpace(
                            Dimensions.heightSize * 0.7,
                          ),
                          Text(
                            Strings.backPart,
                            style: CustomStyle.borderColorText,
                          ),
                        ],
                      ),
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
    );
  }

  _passwordTextInputWIdget(BuildContext context) {
    return Column(
      children: [
        PasswordInputWidget(
          controller: controller.passwordController,
          hintText: Strings.enterPassword,
          labelText: Strings.password,
        ),
        addVerticalSpace(Dimensions.heightSize),
        PasswordInputWidget(
          controller: controller.confirmPasswordController,
          hintText: Strings.enterConfirmPassword,
          labelText: Strings.confirmPassword,
        ),
        RichText(
          text: TextSpan(
            text: Strings.byUsing,
            style: GoogleFonts.inter(
              fontSize: Dimensions.smallTextSize,
              color: CustomColor.primaryTextColor,
              fontWeight: FontWeight.w600,
            ),
            children: [
              WidgetSpan(
                child: CustomTextButton(
                  onPressed: () {
                    controller.onPressedPrivacy();
                  },
                  text: Strings.privacyPolicy,
                ),
              ),
              TextSpan(
                text: " &",
                style: GoogleFonts.inter(
                  fontSize: Dimensions.smallTextSize,
                  color: CustomColor.primaryTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              WidgetSpan(
                child: CustomTextButton(
                  onPressed: () {
                    controller.onPressedUserAgriment();
                  },
                  text: Strings.userAgreement,
                ),
              ),
            ],
          ),
        ),
        addVerticalSpace(Dimensions.heightSize * 1.5),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.heightSize * 2,
      ),
      child: PrimaryButtonWidget(
        text: Strings.continues,
        onPressed: () {
          controller.onPresedcontinue();
        },
      ),
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
    },
  );
}
