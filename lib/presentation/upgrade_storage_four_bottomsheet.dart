import 'package:safebox/controller/upgrade_storage_four_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/validation_functions.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class UpgradeStorageFourBottomsheet extends StatelessWidget {
  UpgradeStorageFourBottomsheet(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  UpgradeStorageFourController controller;

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
                    "lbl_add_card".tr,
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
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Text(
                "lbl_card_number".tr,
                style: CustomTextStyles.labelLargeSofiaPro,
              ),
            ),
          ),
          SizedBox(height: 6.v),
          _buildAddCardRow(),
          SizedBox(height: 19.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 1.v,
                      right: 10.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_expiry_date".tr,
                          style: CustomTextStyles.labelLargeSofiaPro,
                        ),
                        SizedBox(height: 4.v),
                        _buildExpiryDateRow(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_cvv".tr,
                          style: CustomTextStyles.labelLargeSofiaPro,
                        ),
                        SizedBox(height: 6.v),
                        _buildCvvRow(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.v),
          _buildAddButton(),
          SizedBox(height: 25.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAddCardRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.h),
      child: CustomTextFormField(
        controller: controller.addCardRowController,
        hintText: "msg_1234_5678_9012_3456".tr,
        hintStyle: CustomTextStyles.titleMediumBlue800,
      ),
    );
  }

  /// Section Widget
  Widget _buildExpiryDateRow() {
    return CustomTextFormField(
      width: 147.h,
      controller: controller.expiryDateRowController,
      hintText: "lbl_mm_yy".tr,
      hintStyle: CustomTextStyles.titleMediumOnPrimaryContainer_1,
    );
  }

  /// Section Widget
  Widget _buildCvvRow() {
    return CustomTextFormField(
      width: 147.h,
      controller: controller.cvvRowController,
      hintText: "lbl3".tr,
      hintStyle: CustomTextStyles.titleMediumOnPrimaryContainerSemiBold,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || (!isValidPassword(value, isRequired: true))) {
          return "err_msg_please_enter_valid_password".tr;
        }
        return null;
      },
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildAddButton() {
    return CustomElevatedButton(
      height: 50.v,
      text: "lbl_add".tr,
      margin: EdgeInsets.symmetric(horizontal: 11.h),
      buttonStyle: CustomButtonStyles.outlinePrimary,
      buttonTextStyle: CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold,
    );
  }
}
