import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/validation_functions.dart';
import 'package:safebox/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  CustomPhoneNumber({
    Key? key,
    required this.controller,
    required countryCodePicker,
    // required Null Function(dynamic CountryCodePicker) onTap,
  }) : super(
          key: key,
        );

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(
          5.h,
        ),
        border: Border.all(
          color: appTheme.gray40001,
          width: 1.h,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 278.h,
                right: 6.h,
              ),
              child: CustomTextFormField(
                width: 1.h,
                controller: controller,
                hintText: "msg_enter_phone_number".tr,
                hintStyle: CustomTextStyles.bodyLargeRobotoGray500,
                textInputType: TextInputType.phone,
                validator: (value) {
                  if (!isValidPhone(value)) {
                    return "err_msg_please_enter_valid_phone_number".tr;
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
