import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/presentation/home_page_screen.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class UpgradeStorageOneBottomsheet extends StatelessWidget {
  const UpgradeStorageOneBottomsheet({
    Key? key,
  }) : super(
          key: key,
        );

  // UpgradeStorageOneController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 40.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "msg_upgraded_successfully".tr,
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 34.v),
          CustomElevatedButton(
            onPressed: () {
              Get.off(const HomePageScreen());
            },
            height: 50.v,
            text: "lbl_close".tr,
            buttonStyle: CustomButtonStyles.outlinePrimary,
            buttonTextStyle:
                CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold,
          ),
        ],
      ),
    );
  }
}
