import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../../utils/custom_style.dart';

import 'primary_input_widget.dart';

class SignUpCountryCodePickerWidget extends StatelessWidget {
  const SignUpCountryCodePickerWidget({
    Key? key,
    required this.hintText,
    this.keyboardType,
    this.onChanged,
    this.labelText= 'Select Country',
    this.readOnly = false
  }) : super(key: key);

  final String hintText, labelText;
  final TextInputType? keyboardType;
  final ValueChanged? onChanged;
  final bool? readOnly;

  // static String? countryName =;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PrimaryInputWidget(
          controller: TextEditingController(text: ''),
          hintText: '',
          labelText: labelText,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15
          ),
          child: CountryCodePicker(
            initialSelection: hintText,
            padding: EdgeInsets.zero,
            textStyle:  CustomStyle.inputTextStyle,
            onChanged: onChanged,
            showOnlyCountryWhenClosed: true,
            showDropDownButton: readOnly!,
            enabled: readOnly!,
            flagDecoration: const BoxDecoration(
              shape: BoxShape.circle
            ),

            backgroundColor: Colors.transparent,
            alignLeft: true,
            // onInit: (code) => {profileController.countryController.text = code?.name},
          ),
        ),
      ],
    );
  }
}