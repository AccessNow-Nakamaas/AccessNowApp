import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/bottom_sheet_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';
import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/size.dart';
import '../../../widgets/button_widget/primary_button.dart';
import '../../../widgets/others/item_count_widget.dart';
import '../../controller/buy_giftcard_controller/card_view_controller.dart';
import '../../widgets/others/cardview_timelines.dart';

class CardViewScreen extends StatelessWidget {
  CardViewScreen({super.key});

  final controller = Get.put(CardViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.buyGiftcard),
      bottomSheet: CustomBottomShet(
        ontap: () {
          showBottomSheet(context);
        },
        text: Strings.buyNow,
        img: Assets.coin,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() {
      return ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize * 0.6,
        ),
        children: [
          _blackCardWidget(context),
          _cardDetailsWidget(context),
          _buyNowWidget(context),
          _previewWidget(context),
        ],
      );
    });
  }

  _blackCardWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSize * 0.8,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.7,
        vertical: Dimensions.defaultPaddingSize * 0.6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.3),
        color: CustomColor.blackColor,
      ),
      child: Column(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Text(
                Strings.googlePlay,
                style: CustomStyle.addUsdTextStyle,
              ),
              SvgPicture.asset(Assets.playstore)
            ],
          ),
          Text(
            "9864 1326 7135 3126",
            style: TextStyle(
              fontFamily: "AgencyFB",
              fontSize: Dimensions.subTitleText,
              fontWeight: FontWeight.w700,
              color: CustomColor.whiteColor.withOpacity(0.6),
            ),
          ),
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Column(
                mainAxisAlignment: mainCenter,
                children: [
                  Text(
                    Strings.nineElevent,
                    style: CustomStyle.addUsdTextStyle,
                  ),
                  Text(
                    Strings.expiryDate,
                    style: CustomStyle.expairywhiteTextStyle,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: mainCenter,
                children: [
                  Text(
                    Strings.nineSix,
                    style: CustomStyle.addUsdTextStyle,
                  ),
                  Text(
                    Strings.cvc,
                    style: CustomStyle.expairywhiteTextStyle,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _cardDetailsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Text(
          Strings.cardDetails,
          style: CustomStyle.extraLargeBlackTextStyle,
        ),
        addVerticalSpace(Dimensions.heightSize),
        Container(
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height * 0.25,
            child: const CardDetailsPage()),
      ],
    );
  }

  _buyNowWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Text(
          Strings.buyNow,
          style: CustomStyle.extraLargeBlackTextStyle,
        ),
        addVerticalSpace(Dimensions.heightSize),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPaddingSize * 0.2),
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Expanded(
                flex: 6,
                child: Text(
                  Strings.quantity,
                  style: CustomStyle.quantityPriceTextStyle,
                ),
              ),
              Expanded(
                flex: 7,
                child: itemCountWidget(
                  decrease: () {
                    controller.decrease();
                  },
                  increment: () {
                    controller.increment();
                  },
                  value: controller.count.value,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: Dimensions.defaultPaddingSize * 0.8,
          ),
          margin: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPaddingSize * 0.2),
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Text(
                Strings.price,
                style: CustomStyle.quantityPriceTextStyle,
              ),
              Text(
                Strings.uSD100,
                style: CustomStyle.percentTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _previewWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.defaultPaddingSize * 0.3),
      margin: EdgeInsets.only(
          top: Dimensions.marginSize * 2, bottom: Dimensions.marginSize * 5),
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
                  Strings.category,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.googlePlay,
                  style: CustomStyle.smallTextStyle,
                ),
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
                  Strings.subCategory,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.googlePlay60,
                  style: CustomStyle.smallTextStyle,
                ),
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
                  Strings.quantity,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Obx(() => Text(
                  controller.count.value.toString(),
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
                  Strings.price,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.uSD100,
                  style: CustomStyle.smallTextStyle,
                ),
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
                  Strings.charge,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.uSDzero,
                  style: CustomStyle.smallTextStyle,
                ),
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
                Text(
                  Strings.uSD100,
                  style: CustomStyle.smallTextStyle,
                ),
              ],
            ),
          ),
        ],
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
                  Strings.giftcardPurchase,
                  style: CustomStyle.boldTitleTextStyle,
                ),
                Text(
                  Strings.yourGiffCard,
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
