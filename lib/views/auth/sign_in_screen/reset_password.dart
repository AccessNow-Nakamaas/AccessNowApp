import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/button_widget/primary_button.dart';
import 'package:qrpay/widgets/input_widget/password_input_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../../controller/auth/sign_in_controllers/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final controller = Get.put(ResetPasswordController());
 final resetPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.resetPassword),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
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
          top: Dimensions.marginSize, bottom: Dimensions.marginSize * 2.2),
      child: Form(
        key: resetPasswordKey,
        child: Column(
          children: [
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
    return PrimaryButtonWidget(
        text: Strings.resetPassword,
        onPressed: () {
          controller.onPressedResetPass();
        });
  }
}
