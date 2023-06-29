import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.img, required this.text});
  final String img, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.heightSize * 5,
          width: Dimensions.widthSize * 6,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  Assets.iconBG,
                ),
                fit: BoxFit.cover),
          ),
          child: SvgPicture.asset(
            img,
            height: Dimensions.widthSize * 3,
            width: Dimensions.widthSize * 3,
          ),
        ),
        addVerticalSpace(Dimensions.heightSize * 0.4),
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: Dimensions.smallestTextSize,
              fontWeight: FontWeight.w700,
              color: CustomColor.whiteColor),
        ),
      ],
    );
  }
}
