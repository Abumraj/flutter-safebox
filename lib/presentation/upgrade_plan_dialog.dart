import 'package:flutter/material.dart';
import 'package:safebox/controller/starred_folder_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/presentation/upgrade_storage_screen.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class UpgradePlanDialog extends StatelessWidget {
  const UpgradePlanDialog({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 315.h,
      // height: 50,
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
            "Out of Storage",
            style: CustomTextStyles.labelLargeOnPrimaryContainer,
          ),
          SizedBox(height: 20.v),
          Text("msg_need_more_space".tr,
              style: CustomTextStyles.labelLargeSofiaProBlue800),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 8.v,
                      bottom: 9.v,
                    ),
                    child: Text(
                      "lbl_cancel".tr,
                      style: CustomTextStyles.labelLargeSofiaProBlue800,
                    ),
                  ),
                ),
                CustomElevatedButton(
                    height: 40.v,
                    width: 129.h,
                    text: "lbl_upgrade".tr,
                    buttonStyle: CustomButtonStyles.outlinePrimary,
                    onPressed: () {
                      Get.to(const UpgradeStorageScreen());
                    },
                    buttonTextStyle:
                        CustomTextStyles.titleMediumOpenSansWhiteA700),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
