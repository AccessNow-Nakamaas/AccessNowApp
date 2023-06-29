import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../widgets/others/details_timelines_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.details),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      children: [
        _cardWidget(context),
        _cardDetailsWidget(context),
      ],
    );
  }

  _cardWidget(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSize,
      ),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.27,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: mainCenter,
          children: [
            Text(
              Strings.uSD1589,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: CustomColor.primaryColor,
              ),
            ),
            Text(
              Strings.currentBalance,
              style: GoogleFonts.inter(
                fontSize: Dimensions.defaultTextSize,
                fontWeight: FontWeight.w500,
                color: CustomColor.primaryColor,
              ),
            ),
          ],
        ),
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
        Container(
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height * 0.6,
            child: const DetailsTimelinesPage()
        ),
      ],
    );
  }
}
