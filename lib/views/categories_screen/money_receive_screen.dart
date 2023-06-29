import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/input_widget/primary_input_widget.dart';
import 'package:qrpay/widgets/others/bottom_sheet_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../controller/categories_controller/money_receive_controller.dart';

class MoneyReceiveScreen extends StatelessWidget {
  MoneyReceiveScreen({super.key});
  final controller = Get.put(MoneyReciveController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.moneyReceive),
      bottomNavigationBar: CustomBottomShet(
          img: Assets.share, ontap: () {}, text: Strings.share),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        _imgWidget(context),
        _inputWidget(context),
      ],
    );
  }

  _imgWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize,
          vertical: Dimensions.defaultPaddingSize * 1),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        ),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.28,
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.marginSize * 1.4,
            horizontal: Dimensions.marginSize,
          ),
          child: Image.asset(
            Assets.qrCode,
          ),
        ),
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      child: Column(children: [
        PrimaryInputWidget(
          controller: controller.qrAddressController,
          hintText: Strings.qrCode,
          labelText: Strings.qrAddress,
          suffix: SvgPicture.asset(
            Assets.copy,
          ),
        ),
        Text(
          Strings.useQRPaydetails,
          textAlign: TextAlign.justify,
          style: CustomStyle.transferFeeTextStyle,
        )
      ]),
    );
  }
}
