import 'package:flutter/material.dart';
import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class ReferTwoBottomsheet extends StatelessWidget {
  ReferTwoBottomsheet({
    required this.controller,
    Key? key,
  }) : super(
          key: key,
        );

  AccountController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(30.h),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWithdrawSection(),
          // SizedBox(height: 25.v),
          // Text(
          //   "Account Number".tr,
          //   style: CustomTextStyles.bodyMediumBlue800,
          // ),
          // SizedBox(height: 6.v),
          // _buildAccountNumberSection(),
          // SizedBox(height: 17.v),
          // Text(
          //   "Bank".tr,
          //   style: CustomTextStyles.bodyMediumBlue800,
          // ),
          // SizedBox(height: 6.v),
          // // CustomDropDown(
          // //   icon: Container(
          // //     margin: EdgeInsets.fromLTRB(30.h, 17.v, 10.h, 17.v),
          // //     child: CustomImageView(
          // //       imagePath: ImageConstant.imgChevronleft,
          // //       height: 16.adaptSize,
          // //       width: 16.adaptSize,
          // //     ),
          // //   ),
          // //   hintText: "lbl_select_bank".tr,
          // //   items: controller.referTwoModelObj.value.dropdownItemList!.value,
          // //   onChanged: (value) {
          // //     controller.onSelected(value);
          // //   },
          // // ),
          // SizedBox(height: 17.v),
          // Text(
          //   "Account Name".tr,
          //   style: CustomTextStyles.bodyMediumBlue800,
          // ),
          // SizedBox(height: 6.v),
          // _buildAccountNameSection(),
          // SizedBox(height: 17.v),
          Text(
            "Update your account details in the profile section before you proceed."
                .tr,
            style: CustomTextStyles.bodyMediumBlue800,
          ),
          SizedBox(height: 6.v),
          _buildWithdrawalAmountSection(),
          SizedBox(height: 24.v),
          _buildWithdrawButtonSection(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWithdrawSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 9.v),
          child: Text(
            "Withdrawal".tr,
            style: CustomTextStyles.bodyMediumBlue800,
          ),
        ),
        // CustomImageView(
        //   imagePath: ImageConstant.imgArrowRight,
        //   height: 30.adaptSize,
        //   width: 30.adaptSize,
        // ),
      ],
    );
  }

  // /// Section Widget
  // Widget _buildInput() {
  //   return Expanded(
  //     child: Padding(
  //       padding: EdgeInsets.only(top: 2.v),
  //       child: CustomTextFormField(
  //         // controller: controller.inputController,
  //         hintText: "msg_enter_bank_account".tr,
  //         textInputType: TextInputType.number,
  //         // validator: (value) {
  //         //   if (!isNumeric(value)) {
  //         //     return "err_msg_please_enter_valid_number".tr;
  //         //   }
  //         //   return null;
  //         // },
  //       ),
  //     ),
  //   );
  // }

  // /// Section Widget
  // Widget _buildTextInputFieldSection() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 9.h,
  //       vertical: 12.v,
  //     ),
  //     decoration: AppDecoration.outlineGray.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder10,
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         _buildInput(),
  //         Padding(
  //           padding: EdgeInsets.only(
  //             left: 12.h,
  //             top: 2.v,
  //           ),
  //           child: Text(
  //             "lbl_paste".tr,
  //             style: CustomTextStyles.bodyMediumBlue200,
  //           ),
  //         ),
  //         CustomImageView(
  //           imagePath: ImageConstant.imgAkarIconsInfoFill,
  //           height: 18.adaptSize,
  //           width: 18.adaptSize,
  //           margin: EdgeInsets.only(
  //             left: 8.h,
  //             top: 2.v,
  //             bottom: 2.v,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // /// Section Widget
  // Widget _buildAccountNumberSection() {
  //   return CustomTextFormField(
  //     // controller: controller.accountNameSectionController,
  //     hintText: "enter Acct No.".tr,
  //     // validator: (value) {
  //     //   if (!isText(value)) {
  //     //     return "err_msg_please_enter_valid_text".tr;
  //     //   }
  //     //   return null;
  //     // },
  //     contentPadding: EdgeInsets.symmetric(
  //       horizontal: 10.h,
  //       vertical: 15.v,
  //     ),
  //     borderDecoration: TextFormFieldStyleHelper.outlineBlueTL10,
  //   );
  // }

  // Widget _buildAccountNameSection() {
  //   return CustomTextFormField(
  //     // controller: controller.accountNameSectionController,
  //     hintText: "Enter acct name".tr,
  //     // validator: (value) {
  //     //   if (!isText(value)) {
  //     //     return "err_msg_please_enter_valid_text".tr;
  //     //   }
  //     //   return null;
  //     // },
  //     contentPadding: EdgeInsets.symmetric(
  //       horizontal: 10.h,
  //       vertical: 15.v,
  //     ),
  //     borderDecoration: TextFormFieldStyleHelper.outlineBlueTL10,
  //   );
  // }

  /// Section Widget
  Widget _buildWithdrawalAmountSection() {
    return CustomTextFormField(
      controller: controller.withdrawController,
      hintText: "enter amount to withdraw".tr,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.number,
      autovalidateMode: AutovalidateMode.disabled,
      // validator: (value) {
      //   if (!isText(value)) {
      //     return "err_msg_please_enter_valid_text".tr;
      //   }
      //   return null;
      // },
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 15.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineBlueTL10,
    );
  }

  /// Section Widget
  Widget _buildWithdrawButtonSection() {
    return CustomElevatedButton(
      height: 50.v,
      text: "Withdraw".tr,
      buttonStyle: CustomButtonStyles.fillBlueBL5,
      buttonTextStyle: CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold,
      onPressed: () {
        if (double.parse(controller.accountModelObj.value.earnings.toString()) <
            double.parse(controller.withdrawController.text)) {
          ProgressDialogUtils.showFailureToast("Insufficient Balance");
        } else {
          Get.back();
          controller.withDrawalRequest();
        }
      },
    );
  }
}
