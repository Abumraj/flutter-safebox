import 'package:safebox/controller/upgrade_storage_two_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class UpgradeStorageTwoBottomsheet extends StatelessWidget {
  UpgradeStorageTwoBottomsheet(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  UpgradeStorageTwoController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.v,
                    bottom: 4.v,
                  ),
                  child: Text(
                    "lbl_select_new_card".tr,
                    style: CustomTextStyles
                        .titleSmallOpenSansOnPrimaryContainerSemiBold,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowRightOnprimary,
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(
              left: 11.h,
              right: 3.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle4178,
                  height: 26.adaptSize,
                  width: 26.adaptSize,
                  radius: BorderRadius.circular(
                    5.h,
                  ),
                  margin: EdgeInsets.only(
                    top: 4.v,
                    bottom: 3.v,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_first_bank_plc".tr,
                              style: CustomTextStyles.titleSmallBlue800SemiBold,
                            ),
                            SizedBox(height: 8.v),
                            Text(
                              "lbl_679".tr,
                              style:
                                  CustomTextStyles.labelLargeSofiaProBlue800_1,
                            ),
                          ],
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgInfo,
                          height: 26.v,
                          width: 22.h,
                          margin: EdgeInsets.only(bottom: 6.v),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 33.v),
          Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 11.h),
                child: DottedBorder(
                  color: appTheme.indigo900,
                  padding: EdgeInsets.only(
                    left: 1.h,
                    top: 1.v,
                    right: 1.h,
                    bottom: 1.v,
                  ),
                  strokeWidth: 1.h,
                  radius: const Radius.circular(25),
                  borderType: BorderType.RRect,
                  dashPattern: const [
                    3,
                    3,
                  ],
                  child: CustomIconButton(
                    height: 50.adaptSize,
                    width: 50.adaptSize,
                    padding: EdgeInsets.all(16.h),
                    decoration: IconButtonStyleHelper.outlineIndigo,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgPlusIndigo900,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.v),
        ],
      ),
    );
  }
}
