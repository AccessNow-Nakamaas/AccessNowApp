import 'package:flutter/material.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../data/drawer_data/mobile_topup_data.dart';
import '../../utils/dimensions.dart';
import '../../widgets/transaction_widget/recen_transaction_widget.dart';

class MobileTopUpLogScreen extends StatelessWidget {
  const MobileTopUpLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: Strings.mobileTopUpLog),
        body: _bodyWidget(context));
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.defaultPaddingSize * 0.4,
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: mobileTopupList.length,
              itemBuilder: ((context, index) {
                return TransactionWidget(
                  amount: mobileTopupList[index].amount,
                  img: mobileTopupList[index].img,
                  title: mobileTopupList[index].title,
                  subTitle: mobileTopupList[index].subTitle,
                  dateText: mobileTopupList[index].dateText,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
