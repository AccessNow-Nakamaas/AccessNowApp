import 'package:flutter/material.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../data/drawer_data/giftcard_log_data.dart';
import '../../utils/dimensions.dart';
import '../../widgets/transaction_widget/recen_transaction_widget.dart';

class GiftCardLogScreen extends StatelessWidget {
  const GiftCardLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.giftcardLog),
      body: _bodyWidget(context),
    );
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
              itemCount: giftCardList.length,
              itemBuilder: ((context, index) {
                return TransactionWidget(
                  amount: giftCardList[index].amount,
                  img: giftCardList[index].img,
                  title: giftCardList[index].title,
                  subTitle: giftCardList[index].subTitle,
                  dateText: giftCardList[index].dateText,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
