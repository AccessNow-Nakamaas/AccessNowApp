import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Color bgColor;
  final String title;
  List<Widget>? actions;
  final bool centerTitle;
  final double elevation;
  
  CustomAppBar({
    Key? key,
    required this.title,
    this.elevation=2,
    this.bgColor=CustomColor.whiteColor,
    this.actions,
    this.centerTitle = false,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:  Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize*0.8),
        child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child:SvgPicture.asset(Assets.backward,height: Dimensions.heightSize,)
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: CustomColor.primaryTextColor,
          fontSize: Dimensions.extraLargeTextSize,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: elevation,
      actions: actions,
      centerTitle: centerTitle == true ? true : false,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
    );
  }
}
