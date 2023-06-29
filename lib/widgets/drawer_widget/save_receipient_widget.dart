import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/custom_color.dart';

import '../../utils/dimensions.dart';

class SaveReceipientWidget extends StatelessWidget {
  const SaveReceipientWidget(
      {super.key, required this.img, required this.name, required this.gmail});
  final String img, name, gmail;
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
            child: ListTile(
              leading: Image.asset(img),
              title: Text(
                name,
                style: GoogleFonts.inter(
                    fontSize: Dimensions.mediumTextSize,
                    color: CustomColor.primaryTextColor,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Padding(
                padding:  EdgeInsets.only(top:Dimensions.defaultPaddingSize*0.2),
                child: Text(
                  gmail,
                  style: GoogleFonts.inter(
                      fontSize: Dimensions.smallTextSize,
                      color: CustomColor.borderColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )),
      ),
    );
  }
}
