import 'package:flutter/material.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/transaction_widget/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _notificatinWidget(context),
      ],
    );
  }

  _notificatinWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.defaultPaddingSize * 0.3,
        left: Dimensions.defaultPaddingSize * 0.6,
        right: Dimensions.defaultPaddingSize * 0.6,
      ),
      child: Column(
        children: [
          const NotificationWidget(
            img: Assets.notification,
            title: Strings.qRPayUpdate,
            subTitle: Strings.updateYourAppRight,
            dateText: Strings.firstOct,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.8),
          const NotificationWidget(
            img: Assets.offer,
            title: Strings.moreOffer,
            subTitle: Strings.updateYourAppRight,
            dateText: Strings.firstOct,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.8),
          const NotificationWidget(
            img: Assets.notification,
            title: Strings.qRPayUpdate,
            subTitle: Strings.updateYourAppRight,
            dateText: Strings.firstOct,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.8),
          const NotificationWidget(
            img: Assets.offer,
            title: Strings.moreOffer,
            subTitle: Strings.updateYourAppRight,
            dateText: Strings.firstOct,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.8),
          const NotificationWidget(
            img: Assets.notification,
            title: Strings.qRPayUpdate,
            subTitle: Strings.updateYourAppRight,
            dateText: Strings.firstOct,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.8),
          const NotificationWidget(
            img: Assets.offer,
            title: Strings.moreOffer,
            subTitle: Strings.updateYourAppRight,
            dateText: Strings.firstOct,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.8),
          const NotificationWidget(
            img: Assets.notification,
            title: Strings.qRPayUpdate,
            subTitle: Strings.updateYourAppRight,
            dateText: Strings.firstOct,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.8),
          const NotificationWidget(
            img: Assets.offer,
            title: Strings.moreOffer,
            subTitle: Strings.updateYourAppRight,
            dateText: Strings.firstOct,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.8),
          const NotificationWidget(
            img: Assets.notification,
            title: Strings.qRPayUpdate,
            subTitle: Strings.updateYourAppRight,
            dateText: Strings.firstOct,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.8),
        ],
      ),
    );
  }
}
