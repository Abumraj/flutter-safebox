import 'package:flutter/material.dart';
import 'package:safebox/controller/move_page_one_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/validation_functions.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class MovePageOneDialog extends StatelessWidget {
  MovePageOneDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  MovePageOneController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 315.h,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_new_folder".tr,
            style: CustomTextStyles.labelLargeOnPrimaryContainer,
          ),
          SizedBox(height: 14.v),
          CustomTextFormField(
            controller: controller.nameController,
            hintText: "lbl_folder_name".tr,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            },
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 10.v,
            ),
          ),
          SizedBox(height: 20.v),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.v,
                    bottom: 9.v,
                  ),
                  child: Text(
                    "lbl_cancel".tr,
                    style: CustomTextStyles.labelLargeSofiaProBlue800,
                  ),
                ),
                CustomElevatedButton(
                  height: 30.v,
                  width: 74.h,
                  text: "lbl_create".tr,
                  margin: EdgeInsets.only(left: 15.h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
