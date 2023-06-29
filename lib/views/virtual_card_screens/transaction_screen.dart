import 'package:flutter/material.dart';
import 'package:qrpay/data/transaction_data.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../../widgets/transaction_widget/recen_transaction_widget.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.transaction),
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
              itemCount: transactionList.length,
              itemBuilder: ((context, index) {
                return TransactionWidget(
                  amount: transactionList[index].amount,
                  img: transactionList[index].img,
                  title: transactionList[index].title,
                  subTitle: transactionList[index].subTitle,
                  dateText: transactionList[index].dateText,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
