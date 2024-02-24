import 'package:safebox/controller/delete_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';

class DeletePageDialog extends StatelessWidget {
  DeletePageDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  DeletePageController controller;

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "lbl_delete_item".tr,
            style: CustomTextStyles.labelLargeOnPrimaryContainer,
          ),
          SizedBox(height: 14.v),
          Container(
            width: 230.h,
            margin: EdgeInsets.only(right: 43.h),
            child: Text(
              "msg_are_you_sure_you".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleSmallOnPrimary.copyWith(
                height: 1.29,
              ),
            ),
          ),
          SizedBox(height: 14.v),
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
                    style:
                        CustomTextStyles.labelLargeSofiaProOnPrimaryContainer,
                  ),
                ),
                CustomElevatedButton(
                  height: 30.v,
                  width: 74.h,
                  text: "lbl_delete".tr,
                  margin: EdgeInsets.only(left: 15.h),
                  buttonStyle: CustomButtonStyles.fillRedA,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
