import 'package:flutter/material.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../data/drawer_data/bill_payment_data.dart';
import '../../utils/dimensions.dart';
import '../../widgets/transaction_widget/recen_transaction_widget.dart';

class BillPaymentLogScreen extends StatelessWidget {
  const BillPaymentLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.billPaymentLog),
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
              itemCount: billPaymentList.length,
              itemBuilder: ((context, index) {
                return TransactionWidget(
                  amount: billPaymentList[index].amount,
                  img: billPaymentList[index].img,
                  title: billPaymentList[index].title,
                  subTitle: billPaymentList[index].subTitle,
                  dateText: billPaymentList[index].dateText,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

}
