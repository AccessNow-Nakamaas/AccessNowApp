import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/transaction_widget/recen_transaction_widget.dart';
import '../../controller/bottom_navbar_controller/dashboard_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../widgets/bottom_navbar_widget/categories_widget.dart';
import '../../widgets/drawer_widget/custom_drawer_widget.dart';

class DashBordScreen extends StatelessWidget {
  DashBordScreen({super.key});
  final controller = Get.put(DashBoardController());
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            _currentAmountWidget(context),
            _categoriesWidget(context),
            const SizedBox()
          ],
        ),
        _draggableSheet(context),
      ],
    );
  }

  _draggableSheet(BuildContext context) {
    return DraggableScrollableSheet(

      builder: (_, scrollController){
        return _recentTransactionWidget(context, scrollController);
      },
      initialChildSize: 0.55,
      minChildSize: 0.55,
      maxChildSize: 0.99,
    );
  }


  _currentAmountWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize * 1),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          Text(
            Strings.uSD1589,
            style: CustomStyle.currentAmountTexStyle,
          ),
          Text(
            Strings.currentBalance,
            style: CustomStyle.transactionTextStyle,
          ),
        ],
      ),
    );
  }

  _categoriesWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 1.5,
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: Dimensions.widthSize,
        runSpacing: Dimensions.widthSize * 1.8,
        children: [
          GestureDetector(
            onTap: () {
              controller.onTapSend();
            },
            child: const CategoriesWidget(
              img: Assets.send,
              text: Strings.send,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.onTabreceiveMoney();
            },
            child: const CategoriesWidget(
              img: Assets.receive,
              text: Strings.receive,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.onTapRemittance();
            },
            child: const CategoriesWidget(
              img: Assets.remittance,
              text: Strings.remittance,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.onTapVirtualCard();
            },
            child: const CategoriesWidget(
              img: Assets.virtualCards,
              text: Strings.virtualCard,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.onTapBillPay();
            },
            child: const CategoriesWidget(
              img: Assets.billPay,
              text: Strings.billPay,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.onTapMobileTopUp();
            },
            child: const CategoriesWidget(
              img: Assets.mobileTopUp,
              text: Strings.mobileTopUp,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.onTapBuyGift();
            },
            child: const CategoriesWidget(
              img: Assets.buyGiftCard,
              text: Strings.buyGiftcard,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.onTapMyGift();
            },
            child: const CategoriesWidget(
              img: Assets.myGiftcard,
              text: Strings.myGiftcard,
            ),
          ),
        ],
      ),
    );
  }

  _recentTransactionWidget(BuildContext context, scrollController) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      margin: EdgeInsets.only(top: Dimensions.marginSize),
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
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
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        children: [
          addVerticalSpace(Dimensions.heightSize),
          Text(
            Strings.recentTransactions,
            style: CustomStyle.recentTransactionTextStyle,
          ),
          addVerticalSpace(Dimensions.heightSize),
          ListView.separated(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index){
                return TransactionWidget(
                  amount: Strings.aud150,
                  img: index % 2 == 0
                      ? Assets.sendHistory
                      : Assets.receiveHistory,
                  title: Strings.moneySend,
                  subTitle: Strings.tN20236,
                  dateText: Strings.firstOct,
                );
              },
              separatorBuilder: (_, i){
                return addVerticalSpace(
                  Dimensions.heightSize,
                );
              },
              itemCount: 12
          ),

          const TransactionWidget(
            amount: Strings.usd269,
            img: Assets.receiveHistory,
            title: Strings.moneyReceive,
            subTitle: Strings.tN20236,
            dateText: Strings.sep29,
          ),

        ],
      ),
    );
  }
}
