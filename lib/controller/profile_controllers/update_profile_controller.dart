import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/routes.dart';
import '../../utils/strings.dart';

class UpdateProfileController extends GetxController{
  final firstNameController = TextEditingController();
  final lasstNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final selectCityController = TextEditingController();
  final selectZipController = TextEditingController();
  final phoneNumberController = TextEditingController();

  RxString country = 'United States'.obs;
  RxString countryCode = '+1'.obs;

  @override
  void onInit() {
    firstNameController.text = 'Jack';
    lasstNameController.text = 'Balom';
    phoneNumberController.text = '5478388769';
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
    super.dispose();
  }
  RxString selectCityMethod = Strings.selectCity.obs;
  List<String> selectCityList = ["Kabul", "Herat"];
  File? image;
  RxBool haveImage = false.obs;
  final picker = ImagePicker();
  Future chooseFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      haveImage.value = true;
    } else {}
    update();
  }

  Future chooseFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      haveImage.value = true;
    } else {}
    update();
  }

  void onTapUpdateProfile() {
    Get.offAllNamed(Routes.bottomNavBarScreen);
  }


}