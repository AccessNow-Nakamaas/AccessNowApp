import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_color.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboardWidget extends StatefulWidget {
  final Icon? rightIcon;
  final Function()? rightButtonFn;
  final KeyboardTapCallback onKeyboardTap;
  final MainAxisAlignment mainAxisAlignment;

  const NumericKeyboardWidget(
      {Key? key,
        required this.onKeyboardTap,
        this.rightButtonFn,
        this.rightIcon,
        this.mainAxisAlignment = MainAxisAlignment.spaceEvenly})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardWidgetState();
  }
}

class _NumericKeyboardWidgetState extends State<NumericKeyboardWidget> {


  RxBool visible = true.obs;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton2('+'),
              _calcButton('0'),
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: (){
                    visible.value = true;
                    widget.rightButtonFn!();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: const Text(
                        '<',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                          color: CustomColor.whiteColor
                        ),
                      ),
                  )
              )
            ],
          ),
        ],
      ),
    );
  }

  _calcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: Text(
            value,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 35,
                color: CustomColor.whiteColor
            ),
          ),
        ));
  }

  _calcButton2(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {

        },
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: Text(
            value,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 35,
                color: CustomColor.whiteColor
            ),
          ),
        ));
  }
}