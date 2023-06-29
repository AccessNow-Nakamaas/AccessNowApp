import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/input_widget/primary_input_widget.dart';
import 'package:qrpay/widgets/others/bottom_sheet_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../controller/categories_controller/bill_pay_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../widgets/button_widget/primary_button.dart';

class BillPayScreen extends StatelessWidget {
  BillPayScreen({super.key});
  final controller = Get.put(BillPayController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.billPay),
      bottomSheet: CustomBottomShet(
        ontap: () {
          showBottomSheet(context);
        },
        img: Assets.coin,
        text: Strings.payBill,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() {
      return ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSize * 0.7,
          vertical: Dimensions.marginSize * 0.6,
        ),
        children: [
          _inputWidget(context),
          _textWidget(context),
          _previewWidget(context),
          addVerticalSpace(Dimensions.heightSize * 5),
        ],
      );
    });
  }

  _inputWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        PrimaryInputWidget(
          readOnly: true,
          controller: controller.bilTypeController,
          hintText: controller.billCategoryMethod.value,
          labelText: Strings.billType,
          suffix: DropdownButton(
            iconSize: Dimensions.heightSize * 2,
            dropdownColor: CustomColor.whiteColor,
            underline: Container(height: 0),
            items: controller.billCategoryList
                .map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value.toString(),
                child: Text(
                  value.toString(),
                  style: TextStyle(
                    color: controller.billCategoryMethod.value == value
                        ? CustomColor.primaryColor
                        : CustomColor.primaryColor,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              controller.billCategoryMethod.value = value!;
            },
          ),
        ),
        addVerticalSpace(Dimensions.heightSize),
        PrimaryInputWidget(
            controller: controller.bilNumberController,
            hintText: Strings.enterBillNumber,
            labelText: Strings.billNumber,
          onChanged: (value){
              controller.bilNumber.value = value;
          },
        ),
        addVerticalSpace(Dimensions.heightSize),

        //amount widget
        Row(
          mainAxisAlignment: mainCenter,
          children: [
            Expanded(
              flex: 7,
              child: PrimaryInputWidget(
                controller: controller.amountController,
                hintText: Strings.zero00,
                labelText: Strings.amount,
                onChanged: (value){
                  controller.amount.value = double.parse(value);
                  controller.isVisible.value = true;
                },
              ),
            ),
            addHorizontalSpace(
              Dimensions.widthSize,
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: Dimensions.marginSize * 0.33),
                height: Dimensions.heightSize * 3.2,
                width: Dimensions.widthSize * 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius * 0.5,
                  ),
                  color: CustomColor.primaryColor.withOpacity(0.5),
                ),
                child: DropdownButton(
                  alignment: Alignment.center,
                  iconEnabledColor: CustomColor.whiteColor,
                  iconSize: Dimensions.heightSize * 2,
                  dropdownColor: CustomColor.primaryColor,
                  underline: Container(height: 0),
                  items: controller.currencyList
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(
                        value.toString(),
                        style: const TextStyle(
                          color: CustomColor.whiteColor,
                        ),
                      ),
                    );
                  }).toList(),
                  value: controller.selectCurrency.value,
                  onChanged: (String? value) {
                    controller.selectCurrency.value = value!;
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  _textWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Row(
          children: [
            Text(
              Strings.transferFee,
              style: CustomStyle.transferFeeTextStyle,
            ),
            Text(
              Strings.uSD2,
              style: CustomStyle.amountColorTextStyle,
            ),
          ],
        ),
        addVerticalSpace(Dimensions.heightSize * 0.5),
        Row(
          children: [
            Text(
              Strings.limit,
              style: CustomStyle.transferFeeTextStyle,
            ),
            Text(
              Strings.limitAmount,
              style: CustomStyle.amountColorTextStyle,
            ),
          ],
        )
      ],
    );
  }

  _previewWidget(BuildContext context) {
    return Obx(() => Visibility(
      visible: controller.isVisible.value,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding:
            EdgeInsets.symmetric(vertical: Dimensions.defaultPaddingSize * 0.3),
        margin: EdgeInsets.symmetric(
          vertical: Dimensions.marginSize * 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
          color: CustomColor.primaryColor.withOpacity(0.2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: crossStart,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPaddingSize * 0.6,
              ),
              child: Text(
                Strings.preview,
                style: CustomStyle.smallTextStyle,
              ),
            ),
            const Divider(
              color: CustomColor.whiteColor,
            ),

            //started Row widget
            //bill type
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPaddingSize * 0.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.billPay,
                    style: CustomStyle.billTypeTextStyle,
                  ),
                  Obx(() => Text(
                    controller.billCategoryMethod.value,
                    style: CustomStyle.smallTextStyle,
                  )),
                ],
              ),
            ),
            Divider(
              color: CustomColor.primaryColor.withOpacity(0.3),
            ),

            //Bill Number
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPaddingSize * 0.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.billNumber,
                    style: CustomStyle.billTypeTextStyle,
                  ),
                  Obx(() => Text(
                    controller.bilNumber.value,
                    style: CustomStyle.smallTextStyle,
                  )),
                ],
              ),
            ),
            Divider(
              color: CustomColor.primaryColor.withOpacity(0.3),
            ),

            //amount
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPaddingSize * 0.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.amount,
                    style: CustomStyle.billTypeTextStyle,
                  ),
                  Obx(() => Text(
                    "${controller.amount.value} ${controller.selectCurrency.value}",
                    style: CustomStyle.smallTextStyle,
                  )),
                ],
              ),
            ),
            Divider(
              color: CustomColor.primaryColor.withOpacity(0.3),
            ),

            //charge
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPaddingSize * 0.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.charge,
                    style: CustomStyle.billTypeTextStyle,
                  ),
                  Obx(() => Text(
                    "${controller.charge.value} ${controller.selectCurrency.value}",
                    style: CustomStyle.smallTextStyle,
                  )),
                ],
              ),
            ),
            Divider(
              color: CustomColor.primaryColor.withOpacity(0.3),
            ),

            //receive amount
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPaddingSize * 0.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.receivedAmount,
                    style: CustomStyle.billTypeTextStyle,
                  ),
                  Obx(() => Text(
                    "${controller.amount.value} ${controller.selectCurrency.value}",
                    style: CustomStyle.smallTextStyle,
                  )),
                ],
              ),
            ),
            Divider(
              color: CustomColor.primaryColor.withOpacity(0.3),
            ),

            //total payable
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPaddingSize * 0.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.totalPayable,
                    style: CustomStyle.billTypeTextStyle,
                  ),
                  Obx(() => Text(
                    "${controller.amount.value <= 0.0 ? 0: controller.amount.value + controller.charge.value} ${controller.selectCurrency.value}",
                    style: CustomStyle.smallTextStyle,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
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
            child: Column(
              mainAxisAlignment: mainCenter,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.confirm,
                  height: Dimensions.heightSize * 9,
                  width: Dimensions.heightSize * 10,
                ),
                addVerticalSpace(Dimensions.heightSize),
                Text(
                  Strings.paymentSuccess,
                  style: CustomStyle.boldTitleTextStyle,
                ),
                Text(
                  Strings.yourBillHasBeenPaid,
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
