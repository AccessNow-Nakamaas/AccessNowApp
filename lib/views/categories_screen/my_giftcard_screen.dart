import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';
import 'package:flip_card/flip_card.dart';

import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/size.dart';

class MyGiftCardScreen extends StatelessWidget {
  const MyGiftCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.myGiftcard),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        _googlePlayCard(context),
        _netflixCard(context),
      ],
    );
  }

  _googlePlayCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.1,
      ),
      child: FlipCard(
        fill: Fill.fillBack,
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          height: MediaQuery.of(context).size.height * 0.31,
          margin: EdgeInsets.only(
            top: Dimensions.marginSize * 0.8,
            left: Dimensions.marginSize * 0.6,
            right: Dimensions.marginSize * 0.6,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultPaddingSize,
            vertical: Dimensions.defaultPaddingSize * 0.6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 1.3),
            image: const DecorationImage(
              image: AssetImage(Assets.googleFront),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              addVerticalSpace(Dimensions.heightSize * 6),
              Text(
                "9864 1326 7135 3126",
                style: TextStyle(
                  fontFamily: "AgencyFB",
                  fontSize: Dimensions.subTitleText,
                  fontWeight: FontWeight.w700,
                  color: CustomColor.whiteColor.withOpacity(0.6),
                ),
              ),
              addVerticalSpace(Dimensions.heightSize * 2),
              Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  Column(
                    mainAxisAlignment: mainCenter,
                    children: [
                      Text(
                        Strings.nineElevent,
                        style: CustomStyle.addUsdTextStyle,
                      ),
                      Text(
                        Strings.expiryDate,
                        style: CustomStyle.expairywhiteTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: mainCenter,
                    children: [
                      Text(
                        Strings.nineSix,
                        style: CustomStyle.addUsdTextStyle,
                      ),
                      Text(
                        Strings.cvc,
                        style: CustomStyle.expairywhiteTextStyle,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        back: Container(
          height: MediaQuery.of(context).size.height * 0.31,
          margin: EdgeInsets.only(
            top: Dimensions.marginSize * 0.8,
            left: Dimensions.marginSize * 0.6,
            right: Dimensions.marginSize * 0.6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 1.3),
            image: const DecorationImage(
              image: AssetImage(Assets.googleBack),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: crossEnd,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize * 1.1,
                  right: Dimensions.defaultPaddingSize * 0.6,
                ),
                child: Text(
                  Strings.trX9VW3SWKA9Y,
                  style: CustomStyle.expairywhiteTextStyle,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize * 2,
                  left: Dimensions.defaultPaddingSize * 0.6,
                  right: Dimensions.defaultPaddingSize * 0.6,
                ),
                child: Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    Text(
                      Strings.googlePlayGiftCard,
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.whiteColor,
                      ),
                    ),
                    addVerticalSpace(Dimensions.heightSize * 2.2),
                    Row(
                      mainAxisAlignment: mainSpaceBet,
                      children: [
                        Column(
                          mainAxisAlignment: mainCenter,
                          children: [
                            Text(
                              Strings.googlePlay60,
                              style: CustomStyle.addUsdTextStyle,
                            ),
                            Text(
                              Strings.subCategory,
                              style: CustomStyle.expairywhiteTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: mainCenter,
                          children: [
                            Text(
                              Strings.uSD100,
                              style: CustomStyle.addUsdTextStyle,
                            ),
                            Text(
                              Strings.price,
                              style: CustomStyle.expairywhiteTextStyle,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _netflixCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.1,
      ),
      child: FlipCard(
        fill: Fill.fillBack,
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          height: MediaQuery.of(context).size.height * 0.31,
          margin: EdgeInsets.only(
            top: Dimensions.marginSize * 0.8,
            left: Dimensions.marginSize * 0.6,
            right: Dimensions.marginSize * 0.6,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultPaddingSize,
            vertical: Dimensions.defaultPaddingSize * 0.6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 1.3),
            image: const DecorationImage(
              image: AssetImage(Assets.netflixBack),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              addVerticalSpace(Dimensions.heightSize * 6),
              Text(
                "9864 1326 7135 3126",
                style: TextStyle(
                  fontFamily: "AgencyFB",
                  fontSize: Dimensions.subTitleText,
                  fontWeight: FontWeight.w700,
                  color: CustomColor.whiteColor.withOpacity(0.6),
                ),
              ),
              addVerticalSpace(Dimensions.heightSize * 2),
              Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  Column(
                    mainAxisAlignment: mainCenter,
                    children: [
                      Text(
                        Strings.nineElevent,
                        style: CustomStyle.addUsdTextStyle,
                      ),
                      Text(
                        Strings.expiryDate,
                        style: CustomStyle.expairywhiteTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: mainCenter,
                    children: [
                      Text(
                        Strings.nineSix,
                        style: CustomStyle.addUsdTextStyle,
                      ),
                      Text(
                        Strings.cvc,
                        style: CustomStyle.expairywhiteTextStyle,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        back: Container(
          height: MediaQuery.of(context).size.height * 0.31,
          margin: EdgeInsets.only(
            top: Dimensions.marginSize * 0.8,
            left: Dimensions.marginSize * 0.6,
            right: Dimensions.marginSize * 0.6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 1.3),
            image: const DecorationImage(
              image: AssetImage(Assets.netflixFront),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: crossEnd,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize * 1.1,
                  right: Dimensions.defaultPaddingSize * 0.6,
                ),
                child: Text(
                  Strings.trX9VW3SWKA9Y,
                  style: CustomStyle.expairywhiteTextStyle,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize * 2,
                  left: Dimensions.defaultPaddingSize * 0.6,
                  right: Dimensions.defaultPaddingSize * 0.6,
                ),
                child: Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    Text(
                      Strings.netflixGiftCards,
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.whiteColor,
                      ),
                    ),
                    addVerticalSpace(Dimensions.heightSize * 2.2),
                    Row(
                      mainAxisAlignment: mainSpaceBet,
                      children: [
                        Column(
                          mainAxisAlignment: mainCenter,
                          children: [
                            Text(
                              Strings.netflix99,
                              style: CustomStyle.addUsdTextStyle,
                            ),
                            Text(
                              Strings.subCategory,
                              style: CustomStyle.expairywhiteTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: mainCenter,
                          children: [
                            Text(
                              Strings.uSD100,
                              style: CustomStyle.addUsdTextStyle,
                            ),
                            Text(
                              Strings.price,
                              style: CustomStyle.expairywhiteTextStyle,
                            ),
                          ],
                        ),
                      ],
                    )
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
