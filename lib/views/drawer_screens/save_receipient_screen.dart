import 'package:flutter/material.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../data/drawer_data/save_receipient_data.dart';
import '../../utils/dimensions.dart';
import '../../widgets/drawer_widget/save_receipient_widget.dart';

class SaveReceipientScreen extends StatelessWidget {
  const SaveReceipientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.savedReceipients),
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
              itemCount: saveReceipientList.length,
              itemBuilder: ((context, index) {
                return SaveReceipientWidget(
                  img: saveReceipientList[index].img,
                  name: saveReceipientList[index].name,
                  gmail: saveReceipientList[index].gmail,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
