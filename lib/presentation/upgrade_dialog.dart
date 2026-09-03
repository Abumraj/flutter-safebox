import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/presentation/upgrade_storage_screen.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class UpgradePageDialog extends StatelessWidget {
  const UpgradePageDialog({super.key});

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
            "Do you need more storage?",
            style: CustomTextStyles.bodyLargeSFProTextBlack900_1,
          ),
          SizedBox(height: 14.v),
          Text(
            "Try SafeBox premium to enjoy unlimited storage space",
            style: CustomTextStyles.bodyLargeSFProTextBlack400,
          ),
          SizedBox(height: 20.v),
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
                      "No, Thanks",
                      style: CustomTextStyles.labelLargeSofiaProBlue800,
                    ),
                  ),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    Get.to(const UpgradeStorageScreen());
                  },
                  height: 30.v,
                  width: 74.h,
                  text: "lbl_upgrade".tr,
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
