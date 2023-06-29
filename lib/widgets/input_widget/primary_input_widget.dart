import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class PrimaryInputWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final int maxLines;
  final Widget? suffix;
  final bool readOnly;
  final ValueChanged? onChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const PrimaryInputWidget({
    Key? key,
    required this.controller,
    this.maxLines = 1,
    this.suffix,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  State<PrimaryInputWidget> createState() => _PrimaryInputWidgetState();
}

class _PrimaryInputWidgetState extends State<PrimaryInputWidget> {
  FocusNode? focusNode;
  bool isVisibility = true;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 52,
          margin: EdgeInsets.only(top: Dimensions.marginSize * 0.6),
          child: TextFormField(
            keyboardType: widget.keyboardType,
            readOnly: widget.readOnly,
            textInputAction: TextInputAction.next,
            controller: widget.controller,
            onTap: () {
              setState(() {
                focusNode!.requestFocus();
              });
            },
            onFieldSubmitted: (value) {
              setState(() {
                focusNode!.unfocus();
              });
            },
            onChanged: widget.onChanged,
            focusNode: focusNode,
            textAlign: TextAlign.left,
            style: CustomStyle.inputTextStyle,
            decoration: InputDecoration(
             floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.labelText,
              hintText: widget.hintText,
              suffixIcon: Padding(
                padding:  EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize*0.3,
                  bottom: Dimensions.defaultPaddingSize*0.3,
                  right: Dimensions.defaultPaddingSize*0.3
                ),
                child: widget.suffix,
              ),
              labelStyle: GoogleFonts.inter(
                color: focusNode!.hasFocus
                    ? CustomColor.primaryColor
                    : CustomColor.primaryColor.withOpacity(0.5),
                fontSize: Dimensions.smallTextSize,
                fontWeight: FontWeight.w500,
              ),
              hintStyle: GoogleFonts.inter(
                color:  CustomColor.primaryColor.withOpacity(0.6),
                fontSize: Dimensions.smallTextSize,
                fontWeight: FontWeight.w600,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
                  borderSide: BorderSide(
                    color: focusNode!.hasFocus
                        ? CustomColor.primaryColor
                        : CustomColor.primaryColor.withOpacity(0.5),
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
                  borderSide: const BorderSide(
                    color: CustomColor.primaryColor,
                    width: 2,
                  )),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
                  borderSide: const BorderSide(
                    color: CustomColor.primaryColor,
                    width: 2,
                  )),
              contentPadding: EdgeInsets.only(
                left: Dimensions.widthSize * 1,
                top: Dimensions.heightSize * 0.4,
                bottom: Dimensions.heightSize * 0.4,
              ),
            ),
          ),
        )
      ],
    );
  }
}
