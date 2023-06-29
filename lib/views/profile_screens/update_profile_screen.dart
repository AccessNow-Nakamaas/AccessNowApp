import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/controller/profile_controllers/update_profile_controller.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/size.dart';
import '../../widgets/input_widget/country_picker.dart';
import '../../widgets/input_widget/drop_down_input.dart';
import '../../widgets/input_widget/phone_number_input.dart';
import '../../widgets/input_widget/primary_input_widget.dart';
import '../../widgets/others/custom_drop_down.dart';

final controller = Get.put(UpdateProfileController());

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});

  final updateProfileFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.updateProfile),
      bottomSheet: _bottomSheetWidget(context),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      children: [
        _imgWidget(context),
        _inputWidget(context),
        addVerticalSpace(
          Dimensions.heightSize,
        ),
      ],
    );
  }

  _imgWidget(BuildContext context) {
    return InkWell(
      onTap: (){
        _openImageSourceOptions(context);
      },
      child: Obx(() => Container(
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSize * 3.9,
            vertical: Dimensions.marginSize * 2),
        height: Dimensions.heightSize * 10,
        width: Dimensions.widthSize * 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius),
          color: CustomColor.draweBackGround,
          border: Border.all(color: CustomColor.primaryColor, width: 5),
          image: controller.haveImage.value
              ? DecorationImage(
                  image: FileImage(controller.image!)
                )
              : const DecorationImage(
                    image: AssetImage(Assets.profile)
                )
        ),
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(48.0),
          child: SvgPicture.asset(
            Assets.camera,
            height: Dimensions.heightSize * 1.4,
          ),
        ),
      )),
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: updateProfileFormKey,
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
            suffix: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.defaultPaddingSize * 0.1),
              child: SvgPicture.asset(
                Assets.inputRight,
              ),
            ),
            readOnly: true,
            controller: TextEditingController(text: 'jack@email.com'),
            hintText: Strings.enterEmailAddress,
            labelText: Strings.emailAddress,
          ),
          addVerticalSpace(
            Dimensions.heightSize * 1.5,
          ),
          //number,city zip code
          SignUpCountryCodePickerWidget(
            readOnly: true,
            hintText: Strings.selectCountry,
            onChanged: (value){
              controller.countryCode.value = value.toString();
              controller.country.value = value.code.toString();
            },
          ),

          addVerticalSpace(
            Dimensions.heightSize,
          ),
          Row(
            children: [
              Expanded(
                child: Obx(() {
                  return DropdownInputWidget(
                    widget: CustomDropDown(
                        itemsList: controller.selectCityList,
                        selectMethod: controller.selectCityMethod),
                    controller: controller.selectCityController,
                    hintText: controller.selectCityMethod.value,
                    labelText: Strings.selectCity,
                  );
                }),
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
          Obx(() => PhoneNumberWithCountryCodeInput(
            code: controller.countryCode.value,
            readOnly: true,
            suffix: SvgPicture.asset(Assets.inputRight),
            controller: controller.phoneNumberController,
            hintText: "",
            labelText: Strings.phoneNumber,
          )),
          addVerticalSpace(Dimensions.heightSize * 8)
        ],
      ),
    );
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
          controller.onTapUpdateProfile();
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
                Strings.updateProfile,
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
