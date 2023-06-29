import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';

import '../../utils/custom_color.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget(
      {super.key,
      required this.amount,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.dateText});
  final String img, title, subTitle, dateText, amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.defaultPaddingSize * 0.3),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.only(
              bottom: Dimensions.defaultPaddingSize * 0.1,
              right: Dimensions.defaultPaddingSize * 0.4),
          height: Dimensions.heightSize * 5,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SvgPicture.asset(img),
              ),
              Expanded(
                flex: 9,
                child: Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    addVerticalSpace(Dimensions.heightSize),
                    Row(
                      mainAxisAlignment: mainSpaceBet,
                      children: [
                        Text(
                          title,
                          style: CustomStyle.smallTextStyle,
                        ),
                        Text(
                          dateText,
                          style: CustomStyle.dateTextStyle,
                        ),
                      ],
                    ),
                    addVerticalSpace(Dimensions.widthSize * 0.7),
                    Row(
                      mainAxisAlignment: mainSpaceBet,
                      children: [
                        Text(
                          subTitle,
                          style: GoogleFonts.inter(
                            color: CustomColor.secondaryTextColor,
                            fontSize: Dimensions.smallTextSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          amount,
                          style: CustomStyle.recipientTilteTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
