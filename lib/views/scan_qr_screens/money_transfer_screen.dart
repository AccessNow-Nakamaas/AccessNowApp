import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/input_widget/primary_input_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../../controller/scan_qr_controlellers/money_transfer_controller.dart';
import '../../../widgets/others/bottom_sheet_widget.dart';

class MoneyTransferScreen extends StatelessWidget {
  MoneyTransferScreen({super.key});

  final controller = Get.put(MoneyTransferController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.moneyTransfer),
      bottomSheet: CustomBottomShet(
        ontap: () {

          var value = double.parse(controller.amountController.text);
          if(value >= controller.min.value  && value <= controller.max.value){
            controller.onpresedSend();
          }

        },
        text: Strings.send,
        img: Assets.send,
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
        children: [
          _inputWidget(context),
          _textWidget(context),
        ],
      );
    });
  }

  _inputWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize),
      child: Column(children: [
        PrimaryInputWidget(
          controller: controller.qrAddressController,
          hintText: Strings.qrCode,
          labelText: Strings.qrAddress,
          suffix: Container(
            height: Dimensions.heightSize * 1.9,
            width: Dimensions.widthSize * 6,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.radius * 1.5,
              ),
              color: CustomColor.primaryColor.withOpacity(0.3),
            ),
            child: Text(
              Strings.paste,
              style: CustomStyle.priColorTextStyle,
            ),
          ),
        ),
        addVerticalSpace(Dimensions.heightSize),
        Row(
          mainAxisAlignment: mainCenter,
          children: [
            Expanded(
              flex: 9,
              child: PrimaryInputWidget(
                controller: controller.amountController,
                hintText: Strings.zero00,
                labelText: Strings.amount,
              ),
            ),
            addHorizontalSpace(
              Dimensions.widthSize,
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.marginSize * 0.35),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.widthSize
                ),
                height: Dimensions.heightSize * 3.4,
                width: Dimensions.widthSize * 4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius * 0.5,
                  ),
                  color: CustomColor.primaryColor,
                ),
                child: DropdownButton(
                  iconEnabledColor: CustomColor.whiteColor,
                  iconSize: Dimensions.heightSize * 2,
                  dropdownColor: CustomColor.primaryColor,
                  underline: Container(),
                  items: controller.currencyList
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(
                        value.toString(),
                        style: const TextStyle(
                          color: CustomColor.whiteColor
                        ),
                      ),
                    );
                  },).toList(),
                  onChanged: (String? value) {
                    controller.selectCurrency.value = value!;
                  },
                  value: controller.selectCurrency.value,
                ),
              ),
            )
          ],
        )
      ]),
    );
  }

  _textWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Row(
          children: [
            Text(
             "${controller.fee.value} ${controller.selectCurrency.value}",
              style: CustomStyle.transferFeeTextStyle,
            ),
            Obx(() => Text(
              controller.selectCurrency.value,
              style: CustomStyle.amountColorTextStyle,
            )),
          ],
        ),
        addVerticalSpace(Dimensions.heightSize * 0.5),
        Row(
          children: [
            Text(
              Strings.limit,
              style: CustomStyle.transferFeeTextStyle,
            ),
            Obx(() => Text(
              '${controller.min.value} ${controller.selectCurrency.value} - ${controller.max.value} ${controller.selectCurrency.value}',
              style: CustomStyle.amountColorTextStyle,
            )),
          ],
        )
      ],
    );
  }
}
