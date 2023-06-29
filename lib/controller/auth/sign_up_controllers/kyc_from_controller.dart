import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrpay/routes/routes.dart';
import 'package:qrpay/utils/strings.dart';

import 'sign_up_controller.dart';

class KYCFromController extends GetxController {
  final firstNameController = TextEditingController();
  final lasstNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final selectCityController = TextEditingController();
  final selectZipController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxString country = 'United States'.obs;

  final signUpController = Get.put(SignUpController());
  @override
  void onInit() {
    phoneNumberController.text = signUpController.phoneNumberController.text;
    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lasstNameController.dispose();
    emailAddressController.dispose();
     selectCityController.dispose();
    selectZipController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  RxString selectCityMethod = Strings.selectCity.obs;
  List<String> selectCityList = ["Kabul", "Herat"];
  void onPressedSignIn() {
    Get.toNamed(Routes.signInScreen);
  }

  File? image;
  final picker = ImagePicker();
  Future chooseFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {}
    update();
  }

  Future chooseFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {}
    update();
  }

  
  void onPressedUserAgriment() {}

  void onPressedPrivacy() {}

  void onPresedcontinue() {
    Get.toNamed(Routes.fingerPrintScreen);
  }
}
