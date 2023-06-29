import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/bottom_sheet_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';
import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';
import '../../../widgets/button_widget/primary_button.dart';
import '../../../widgets/input_widget/country_picker.dart';
import '../../../widgets/input_widget/phone_number_input.dart';
import '../../../widgets/input_widget/primary_input_widget.dart';
import '../../controller/remitance_controller/add_receipient_controller.dart';
import '../../widgets/input_widget/drop_down_input.dart';
import '../../widgets/others/custom_drop_down.dart';

final controller = Get.put(AddReceipientController());

class AddReceipientScreen extends StatelessWidget {
  AddReceipientScreen({super.key});
  final receipientFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.addReceipient),
      bottomSheet: CustomBottomShet(
        img: Assets.person,
        ontap: () {},
        text: Strings.addReceipient,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize * 0.6,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          _inputFieldWidget(context),
          _uploadImage(context),
        ],
      );
    });
  }

  _inputFieldWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize),
      child: Form(
        key: receipientFormKey,
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
              hintText: Strings.selectCountry,
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
                        itemsList: controller.cityList,
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
              suffix: SvgPicture.asset(Assets.inputRight),
              controller: controller.phoneNumberController,
              hintText: "01774930284",
              labelText: Strings.phoneNumber,
            ),
            addVerticalSpace(Dimensions.heightSize * 1.5)
          ],
        ),
      ),
    );
  }

  _uploadImage(BuildContext context) {
    return DottedBorder(
      dashPattern: const [6, 4],
      strokeWidth: 2,
      color: CustomColor.borderColor,
      child: SizedBox(
        height: Dimensions.heightSize * 3.8,
        child: GestureDetector(
          onTap: () {
            _openImageSourceOptions(context);
          },
          child: Row(
            mainAxisAlignment: mainCenter,
            children: [
              SvgPicture.asset(
                Assets.addimage,
                // ignore: deprecated_member_use
                color: CustomColor.borderColor,
              ),
              addHorizontalSpace(
                Dimensions.heightSize * 0.7,
              ),
              Text(
                Strings.uploadImage,
                style: CustomStyle.borderColorText,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showBottomSheet(BuildContext context) => showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 1.5),
          topRight: Radius.circular(Dimensions.radius * 1.5),
        )),
        elevation: 0,
        backgroundColor: CustomColor.whiteColor,
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius * 1.5),
              topRight: Radius.circular(Dimensions.radius * 1.5),
            )),
            padding: EdgeInsets.all(Dimensions.marginSize * 0.9),
            height: MediaQuery.of(context).size.height * 0.42,
            child: Column(
              mainAxisAlignment: mainCenter,
              children: [
                Image.asset(
                  Assets.confirm,
                  height: Dimensions.heightSize * 9,
                  width: Dimensions.heightSize * 10,
                ),
                addVerticalSpace(Dimensions.heightSize),
                Text(
                  Strings.transferSuccess,
                  style: CustomStyle.boldTitleTextStyle,
                ),
                Text(
                  Strings.yourmoneySenSuccess,
                  textAlign: TextAlign.center,
                  style: CustomStyle.defaultSubTitleTextStyle,
                ),
                addVerticalSpace(Dimensions.heightSize * 2),
                PrimaryButtonWidget(
                    text: Strings.backtoHome,
                    onPressed: () {
                      controller.onPresedbackToHome();
                    }),
              ],
            ),
          );
        },
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
