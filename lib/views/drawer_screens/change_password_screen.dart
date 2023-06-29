import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/controller/settings_controller/change_password_controller.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/button_widget/primary_button.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../utils/size.dart';
import '../../widgets/input_widget/password_input_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final controller = Get.put(ChangePasswordController());
  final changePasswordKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.changePassword),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.6),
      physics: const BouncingScrollPhysics(),
      children: [
        _inputWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize,
        bottom: Dimensions.marginSize * 2.2,
      ),
      child: Form(
        key: changePasswordKey,
        child: Column(
          children: [
            PasswordInputWidget(
              controller: controller.oldPasswordController,
              hintText: Strings.enterOldPassword,
              labelText: Strings.oldPassword,
            ),
            addVerticalSpace(
              Dimensions.heightSize,
            ),
            PasswordInputWidget(
              controller: controller.newPasswordController,
              hintText: Strings.enterNewPassword,
              labelText: Strings.newPassword,
            ),
            addVerticalSpace(
              Dimensions.heightSize,
            ),
            PasswordInputWidget(
              controller: controller.confirmPasswordController,
              hintText: Strings.enterConfirmPassword,
              labelText: Strings.confirmPassword,
            ),
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.defaultPaddingSize * 0.5),
      child: PrimaryButtonWidget(
          text: Strings.changePassword,
          onPressed: () {
            controller.onTapChangePassword();
          }),
    );
  }
}
