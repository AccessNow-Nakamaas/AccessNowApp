import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../widgets/transaction_widget/recen_transaction_widget.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.myWallet),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _cardWidget(context),
        _recentTransaction(context),
      ],
    );
  }

  _cardWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.marginSize, horizontal: Dimensions.marginSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        image: const DecorationImage(
          image: AssetImage(
            Assets.myWallett,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          Text(
            Strings.uSD1589,
            style: CustomStyle.currentAmountTexStyle,
          ),
          Text(
            Strings.currentBalance,
            style: GoogleFonts.inter(
              fontSize: Dimensions.defaultTextSize,
              color: CustomColor.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  _recentTransaction(BuildContext context) {
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            addVerticalSpace(Dimensions.heightSize),
            Text(
              Strings.recentTransactions,
              style: CustomStyle.recentTransactionTextStyle,
            ),
            addVerticalSpace(Dimensions.heightSize),
            const TransactionWidget(
              amount: Strings.aud150,
              img: Assets.sendHistory,
              title: Strings.moneySend,
              subTitle: Strings.tN20236,
              dateText: Strings.firstOct,
            ),
            addVerticalSpace(
              Dimensions.heightSize,
            ),
            const TransactionWidget(
              amount: Strings.usd269,
              img: Assets.receiveHistory,
              title: Strings.moneyReceive,
              subTitle: Strings.tN20236,
              dateText: Strings.sep29,
            ),
            addVerticalSpace(
              Dimensions.heightSize,
            ),
            const TransactionWidget(
              amount: Strings.uSD100,
              img: Assets.sendHistory,
              title: Strings.moneySend,
              subTitle: Strings.tN20236,
              dateText: Strings.firstOct,
            ),
            addVerticalSpace(
              Dimensions.heightSize,
            ),
            const TransactionWidget(
              amount: Strings.usd269,
              img: Assets.receiveHistory,
              title: Strings.moneyReceive,
              subTitle: Strings.tN20236,
              dateText: Strings.sep29,
            ),
            addVerticalSpace(
              Dimensions.heightSize,
            ),
            const TransactionWidget(
              amount: Strings.usd269,
              img: Assets.receiveHistory,
              title: Strings.moneyReceive,
              subTitle: Strings.tN20236,
              dateText: Strings.sep29,
            ),
            addVerticalSpace(
              Dimensions.heightSize,
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
      ),
    );
  }
}
