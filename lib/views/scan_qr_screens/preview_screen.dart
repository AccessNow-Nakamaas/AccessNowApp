import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/button_widget/primary_button.dart';
import 'package:qrpay/widgets/others/dashboard_appbar.dart';

import '../../../controller/scan_qr_controlellers/preview_controller.dart';
import '../../../utils/dimensions.dart';
import '../../controller/scan_qr_controlellers/money_transfer_controller.dart';

final controller = Get.put(PreviewController());

class PreviewScreen extends StatelessWidget {
  PreviewScreen({super.key});

  final controller = Get.put(MoneyTransferController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.dashboard),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              _appbarWidget(context),
              _transactionWidget(context),
              _recipientInformationWIdget(context),
              _amountInformationWIdget(context),
              const Spacer(),
              _buttonWidget(context),
            ],
          ),
        ),
      ],
    );
  }

  _appbarWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            CustomColor.whiteColor.withOpacity(0.0),
            CustomColor.whiteColor.withOpacity(0.1)
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: DashboardAppBar(
          elevation: 0,
          centerTitle: false,
          ledeaing: Container(
            padding:
                EdgeInsets.symmetric(vertical: Dimensions.heightSize),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                Assets.backward,
                // ignore: deprecated_member_use
                color: CustomColor.whiteColor,
                height: Dimensions.heightSize,
              ),
            ),
          ),
          title: Strings.preview),
    );
  }

  _transactionWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 1.8,
      ),
      child: Column(
        children: [
          Text(
            Strings.tRX2136987,
            style: CustomStyle.currentAmountTexStyle,
          ),
          Text(
            Strings.transactionNo,
            style: CustomStyle.transactionTextStyle,
          )
        ],
      ),
    );
  }

  _recipientInformationWIdget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize * 0.8,
        vertical: Dimensions.marginSize,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            CustomColor.whiteColor.withOpacity(0.2),
            CustomColor.whiteColor.withOpacity(0.1)
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.defaultPaddingSize * 0.5,
                left: Dimensions.defaultPaddingSize * 0.6),
            child: Text(
              Strings.recipientInformation,
              style: CustomStyle.recipientInformationTexStyle,
            ),
          ),
          addVerticalSpace(Dimensions.heightSize * 0.5),
          Divider(
            color: CustomColor.primaryColor.withOpacity(0.5),
            height: 2,
          ),
          addVerticalSpace(
            Dimensions.heightSize * 1.6,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPaddingSize * 0.6,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.sayok,
                      style: CustomStyle.nameTexStyle,
                    ),
                    Text(
                      Strings.qrCode,
                      style: CustomStyle.nameTexStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.sayokGmail,
                      style: CustomStyle.qrAddressTextStyle,
                    ),
                    Text(
                      Strings.qrAddress,
                      style: CustomStyle.qrAddressTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _amountInformationWIdget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize * 0.8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            CustomColor.whiteColor.withOpacity(0.1),
            CustomColor.whiteColor.withOpacity(0.1)
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.defaultPaddingSize * 0.5,
                left: Dimensions.defaultPaddingSize * 0.6),
            child: Text(
              Strings.amountInformation,
              style: CustomStyle.recipientInformationTexStyle,
            ),
          ),
          addVerticalSpace(Dimensions.heightSize * 0.5),
          Divider(
            color: CustomColor.primaryColor.withOpacity(0.5),
            height: 2,
          ),
          addVerticalSpace(
            Dimensions.heightSize * 1.6,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPaddingSize * 0.6,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.enteredAmount,
                      style: CustomStyle.costTextStyle,
                    ),
                    Text(
                      "${controller.amountController.text} ${controller.selectCurrency.value}",
                      style: CustomStyle.amountTextStyle,
                    ),
                  ],
                ),
                addVerticalSpace(Dimensions.heightSize * 0.3),
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.transferFee,
                      style: CustomStyle.costTextStyle,
                    ),
                    Text(
                      "${controller.fee.value} ${controller.selectCurrency.value}",
                      style: CustomStyle.amountTextStyle,
                    ),
                  ],
                ),
                addVerticalSpace(Dimensions.heightSize * 0.3),
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.recipientReceived,
                      style: CustomStyle.costTextStyle,
                    ),
                    Text(
                      "${double.parse(controller.amountController.text) - controller.fee.value} ${controller.selectCurrency.value}",
                      style: CustomStyle.amountTextStyle,
                    ),
                  ],
                ),
                addVerticalSpace(Dimensions.heightSize * 0.3),
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.totalPayable,
                      style: CustomStyle.costTextStyle,
                    ),
                    Text(
                      "${controller.amountController.text} ${controller.selectCurrency.value}",
                      style: CustomStyle.amountTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Dimensions.defaultPaddingSize * 1.2,
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        bottom: Dimensions.marginSize,
      ),
      height: Dimensions.heightSize * 8,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              CustomColor.whiteColor.withOpacity(0.1),
              CustomColor.whiteColor.withOpacity(0.1)
            ],
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius * 2),
            topRight: Radius.circular(Dimensions.radius * 2),
          )),
      child: GestureDetector(
        onTap: () {
          rightShowBottomSheet(context);
        },
        child: Container(
          height: Dimensions.heightSize * 4.2,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
              color: CustomColor.primaryColor),
          child: Center(
            child: Row(
              mainAxisAlignment: mainCenter,
              children: [
                SvgPicture.asset(
                  Assets.send,
                  // ignore: deprecated_member_use
                  color: CustomColor.whiteColor,
                  height: Dimensions.heightSize * 1.5,
                  width: Dimensions.widthSize * 2,
                ),
                addHorizontalSpace(
                  Dimensions.widthSize * 0.7,
                ),
                Text(
                  Strings.confirmSend,
                  style: GoogleFonts.inter(
                    fontSize: Dimensions.extraLargeTextSize,
                    color: CustomColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //wrong botom sheet
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
              ),
            ),
            padding: EdgeInsets.all(Dimensions.marginSize * 0.9),
            height: MediaQuery.of(context).size.height * 0.43,
            child: Column(
              mainAxisAlignment: mainCenter,
              children: [
                Image.asset(
                  Assets.wrong,
                  height: Dimensions.heightSize * 8,
                  width: Dimensions.heightSize * 8,
                ),
                addVerticalSpace(Dimensions.heightSize),
                Text(
                  Strings.transferFailed,
                  style: CustomStyle.boldTitleTextStyle,
                ),
                Text(
                  Strings.yourMoneyhasBeeenFailed,
                  textAlign: TextAlign.center,
                  style: CustomStyle.defaultSubTitleTextStyle,
                ),
                addVerticalSpace(Dimensions.heightSize * 2),
                PrimaryButtonWidget(
                  backgroundColor: const Color(0xFFF83838),
                  text: Strings.tryAgain,
                  onPressed: () {
                    rightShowBottomSheet(context);
                  },
                ),
              ],
            ),
          );
        },
      );
}

//Right bottom sheet
rightShowBottomSheet(BuildContext context) => showModalBottomSheet<void>(
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
          height: MediaQuery.of(context).size.height * 0.43,
          child: Column(
            mainAxisAlignment: mainCenter,
            children: [
              Image.asset(
                Assets.confirm,
                height: Dimensions.heightSize * 8,
                width: Dimensions.heightSize * 8,
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
