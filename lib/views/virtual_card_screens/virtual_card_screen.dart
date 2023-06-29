import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';
import '../../../widgets/transaction_widget/recen_transaction_widget.dart';
import '../../controller/virtual_card_controller/virtual_card_controller.dart';

class VirtualCardScreen extends StatelessWidget {
  VirtualCardScreen({super.key});
  final controller = Get.put(VirtualCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.virtualCard),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultPaddingSize * 0.6,
          ),
          child: Column(
            children: [
              _cardWidget(context),
              _cardCategoriesWidget(context),
              const SizedBox()
            ],
          ),
        ),

        _draggableSheet(context),

      ],
    );
  }

  _draggableSheet(BuildContext context) {
    return DraggableScrollableSheet(

      builder: (_, scrollController){
        return _recentTransWidget(context, scrollController);
      },
      initialChildSize: 0.45,
      minChildSize: 0.45,
      maxChildSize: 0.8,
    );
  }


  _cardWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.34,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize*0.7,
        vertical: Dimensions.defaultPaddingSize,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(Assets.virtualCard), fit: BoxFit.cover),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 1.5),
          topRight: Radius.circular(Dimensions.radius * 1.5),
          bottomLeft: Radius.circular(Dimensions.radius * 1.5),
          bottomRight: Radius.circular(Dimensions.radius * 1.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          addVerticalSpace(Dimensions.heightSize * 5),
          Text(
            "9864 1326 7135 3126",
            style: TextStyle(
              fontFamily: "AgencyFB",
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: CustomColor.whiteColor.withOpacity(0.6),
            ),
          ),
          addVerticalSpace(Dimensions.heightSize * 2),
          Row(
            children: [
              Column(
                mainAxisAlignment: mainCenter,
                children: [
                  Text(
                    Strings.nineElevent,
                    style: CustomStyle.transactionTextStyle,
                  ),
                  Text(
                    Strings.expiryDate,
                    style: CustomStyle.expiryTextStyle,
                  ),
                ],
              ),
              addHorizontalSpace(Dimensions.widthSize * 6),
              Column(
                mainAxisAlignment: mainCenter,
                children: [
                  Text(
                    Strings.nineSix,
                    style: CustomStyle.transactionTextStyle,
                  ),
                  Text(
                    Strings.cvc,
                    style: CustomStyle.expiryTextStyle,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _cardCategoriesWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              controller.onTapDetails();
            },
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 100),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: CustomColor.whiteColor,
                    child: SvgPicture.asset(Assets.details),
                  ),
                ),
                addVerticalSpace(Dimensions.heightSize * 0.4),
                Text(
                  Strings.details,
                  style: CustomStyle.detailsColorTextStyle,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.onTapFound();
            },
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 100),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: CustomColor.whiteColor,
                    child: SvgPicture.asset(Assets.found),
                  ),
                ),
                addVerticalSpace(Dimensions.heightSize * 0.4),
                Text(
                  Strings.found,
                  style: CustomStyle.detailsColorTextStyle,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.onTapTransaction();
            },
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 100),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: CustomColor.whiteColor,
                    child: SvgPicture.asset(Assets.transaction),
                  ),
                ),
                addVerticalSpace(Dimensions.heightSize * 0.4),
                Text(
                  Strings.transaction,
                  style: CustomStyle.detailsColorTextStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _recentTransWidget(BuildContext context, scrollController) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.widthSize,
          vertical: Dimensions.heightSize
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Dimensions.radius * 1.5,
          ),
          topRight: Radius.circular(
            Dimensions.radius * 1.5,
          ),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        children: [
          addVerticalSpace(Dimensions.heightSize),
          Text(
            Strings.recentTransactions,
            style: CustomStyle.recentTransactionTextStyle,
          ),
          addVerticalSpace(
            Dimensions.heightSize,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, i){
              return addVerticalSpace(Dimensions.heightSize);
            },
            itemCount: 12,
            itemBuilder: (_, i){
              return TransactionWidget(
                amount: Strings.aud150,
                img: i%2 == 0 ? Assets.receiveHistory: Assets.sendHistory,
                title: Strings.moneySend,
                subTitle: Strings.tN20236,
                dateText: Strings.firstOct,
              );
            },
          )
        ],
      ),
    );
  }
}
