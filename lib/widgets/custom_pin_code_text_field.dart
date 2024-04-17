import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:safebox/core/app_export.dart';

// ignore: must_be_immutable
class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
    required this.onComplete,
  }) : super(
          key: key,
        );

  final Alignment? alignment;
  final Function(String) onComplete;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: context,
        controller: controller,
        length: 4,
        autoFocus: true,
        keyboardType: TextInputType.number,
        textStyle: textStyle ?? CustomTextStyles.headlineSmallBlue90001,
        hintStyle: hintStyle ?? CustomTextStyles.headlineSmallBlack90001,
        onCompleted: onComplete,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 45.h,
          fieldWidth: 45.h,
          shape: PinCodeFieldShape.box,
          inactiveFillColor: appTheme.amberA200,
          activeFillColor: appTheme.whiteA700,
          selectedFillColor: appTheme.amberA200,
          inactiveColor: appTheme.amberA200,
          activeColor: appTheme.amberA200,
          selectedColor: appTheme.blue700,
        ),
        onChanged: (value) => onChanged(value),
        validator: validator,
      );
}
