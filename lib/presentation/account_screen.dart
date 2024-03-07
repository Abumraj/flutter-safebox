import 'package:flutter/material.dart';
import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/validation_functions.dart';
import 'package:safebox/presentation/settings_screen.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_icon_button.dart';
import 'package:safebox/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AccountScreen extends GetWidget<AccountController> {
  AccountScreen({Key? key}) : super(key: key);
  final AccountController accountController = Get.put(AccountController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 17.v),
                child: Column(children: [
                  CustomIconButton(
                      height: 62.adaptSize,
                      width: 62.adaptSize,
                      padding: EdgeInsets.all(16.h),
                      decoration: IconButtonStyleHelper.outlineBlue,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgBxBxsUserWhiteA700)),
                  SizedBox(height: 13.v),
                  Text("lbl_profile_image".tr,
                      style: CustomTextStyles.titleMediumSemiBold),
                  SizedBox(height: 5.v),
                  InkWell(
                    onTap: () {
                      accountController.updateProfilePicture();
                    },
                    child: Text("lbl_add_a_picture".tr,
                        style: CustomTextStyles.bodySmallBlue800),
                  ),
                  SizedBox(height: 30.v),
                  _buildName(),
                  SizedBox(height: 30.v),
                  _buildEmail(),
                  SizedBox(height: 30.v),
                  _buildPhoneNumber(),
                  SizedBox(height: 30.v),
                  _buildAccountName(),
                  SizedBox(height: 30.v),
                  _buildAccountNumber(),
                  SizedBox(height: 30.v),
                  _buildBank(),
                  SizedBox(height: 100.v),
                  _buildSave(),
                  SizedBox(height: 100.v),
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarTitle(
            text: "lbl_account".tr, margin: EdgeInsets.only(left: 10.h)));
  }

  /// Section Widget
  Widget _buildName() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: CustomTextFormField(
            controller: controller.nameController,
            hintText: "Enter your full name".tr,
            borderDecoration: TextFormFieldStyleHelper.outlineGrayF,
            fillColor: appTheme.gray10001));
  }

  Widget _buildBank() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: CustomTextFormField(
            controller: controller.bankController,
            hintText: "Enter your Bank Tpye e.g GTB BANK".tr,
            borderDecoration: TextFormFieldStyleHelper.outlineGrayF,
            fillColor: appTheme.gray10001));
  }

  Widget _buildAccountName() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: CustomTextFormField(
            controller: controller.accountNameController,
            hintText: "Enter your Bank Account name".tr,
            borderDecoration: TextFormFieldStyleHelper.outlineGrayF,
            fillColor: appTheme.gray10001));
  }

  Widget _buildAccountNumber() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: CustomTextFormField(
            controller: controller.accountNumberController,
            hintText: "Enter your Account Number".tr,
            borderDecoration: TextFormFieldStyleHelper.outlineGrayF,
            fillColor: appTheme.gray10001));
  }

  /// Section Widget
  Widget _buildEmail() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: CustomTextFormField(
            controller: controller.emailController,
            hintText: "Enter your Email address".tr,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },
            borderDecoration: TextFormFieldStyleHelper.outlineGrayF,
            fillColor: appTheme.gray10001));
  }

  /// Section Widget
  Widget _buildPhoneNumber() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: CustomTextFormField(
            controller: controller.phoneNumberController,
            hintText: "Enter your phone number",
            hintStyle: theme.textTheme.bodyLarge!,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.phone,
            validator: (value) {
              if (!isValidPhone(value)) {
                return "err_msg_please_enter_valid_phone_number".tr;
              }
              return null;
            },
            borderDecoration: TextFormFieldStyleHelper.outlineGrayF,
            fillColor: appTheme.gray10001));
  }

  /// Section Widget
  Widget _buildSave() {
    return CustomElevatedButton(
        height: 50.v,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            controller.updateProfile();
          }
        },
        text: "lbl_save".tr,
        margin: EdgeInsets.symmetric(horizontal: 30.h),
        buttonStyle: CustomButtonStyles.outlinePrimary,
        buttonTextStyle: CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold);
  }

  /// Section Widget
  // Widget _buildUploadToSavebox() {
  //   return Align(
  //       alignment: Alignment.topCenter,
  //       child: Container(
  //           padding: EdgeInsets.symmetric(horizontal: 29.h),
  //           decoration:
  //               BoxDecoration(borderRadius: BorderRadiusStyle.customBorderTL30),
  //           child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                     height: 156.v,
  //                     width: 316.h,
  //                     margin: EdgeInsets.only(left: 1.h),
  //                     child: Stack(alignment: Alignment.topRight, children: [
  //                       Align(
  //                           alignment: Alignment.topLeft,
  //                           child: Padding(
  //                               padding: EdgeInsets.only(top: 20.v),
  //                               child: Text("lbl_add_to_savebox".tr,
  //                                   style: theme.textTheme.labelLarge))),
  //                       CustomImageView(
  //                           imagePath: ImageConstant.imgClose,
  //                           height: 10.adaptSize,
  //                           width: 10.adaptSize,
  //                           alignment: Alignment.topRight,
  //                           margin: EdgeInsets.only(top: 25.v)),
  //                       Align(
  //                           alignment: Alignment.centerLeft,
  //                           child: Obx(() => CustomCheckboxButton(
  //                               alignment: Alignment.centerLeft,
  //                               text: "lbl_create_folder".tr,
  //                               value: controller.createFolder.value,
  //                               onChange: (value) {
  //                                 controller.createFolder.value = value;
  //                               }))),
  //                       Align(
  //                           alignment: Alignment.bottomLeft,
  //                           child: Padding(
  //                               padding: EdgeInsets.only(bottom: 35.v),
  //                               child: Obx(() => CustomCheckboxButton(
  //                                   alignment: Alignment.bottomLeft,
  //                                   text: "lbl_upload_files".tr,
  //                                   value: controller.uploadFiles.value,
  //                                   onChange: (value) {
  //                                     controller.uploadFiles.value = value;
  //                                   })))),
  //                       Align(
  //                           alignment: Alignment.bottomLeft,
  //                           child: Obx(() => CustomCheckboxButton(
  //                               alignment: Alignment.bottomLeft,
  //                               text: "msg_upload_photos_and".tr,
  //                               value: controller.uploadPhotosAndVideos.value,
  //                               onChange: (value) {
  //                                 controller.uploadPhotosAndVideos.value =
  //                                     value;
  //                               }))),
  //                       Align(
  //                           alignment: Alignment.topCenter,
  //                           child: Container(
  //                               margin: EdgeInsets.only(right: 1.h),
  //                               padding: EdgeInsets.symmetric(
  //                                   horizontal: 20.h, vertical: 14.v),
  //                               decoration: BoxDecoration(
  //                                   borderRadius:
  //                                       BorderRadiusStyle.roundedBorder10),
  //                               child: Column(
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   mainAxisAlignment: MainAxisAlignment.center,
  //                                   children: [
  //                                     Text("lbl_new_folder".tr,
  //                                         style: theme.textTheme.labelLarge),
  //                                     SizedBox(height: 15.v),
  //                                     Container(
  //                                         width: 275.h,
  //                                         padding: EdgeInsets.symmetric(
  //                                             horizontal: 14.h, vertical: 4.v),
  //                                         decoration: AppDecoration.outlineGray
  //                                             .copyWith(
  //                                                 borderRadius:
  //                                                     BorderRadiusStyle
  //                                                         .roundedBorder5),
  //                                         child: Column(
  //                                             mainAxisSize: MainAxisSize.min,
  //                                             crossAxisAlignment:
  //                                                 CrossAxisAlignment.start,
  //                                             mainAxisAlignment:
  //                                                 MainAxisAlignment.center,
  //                                             children: [
  //                                               SizedBox(height: 1.v),
  //                                               SizedBox(
  //                                                   width: 80.h,
  //                                                   child: Text(
  //                                                       "lbl_folder_name".tr,
  //                                                       maxLines: null,
  //                                                       overflow: TextOverflow
  //                                                           .ellipsis,
  //                                                       style: theme.textTheme
  //                                                           .titleSmall!
  //                                                           .copyWith(
  //                                                               height: 2.71)))
  //                                             ])),
  //                                     SizedBox(height: 20.v),
  //                                     Align(
  //                                         alignment: Alignment.centerRight,
  //                                         child: Row(
  //                                             mainAxisAlignment:
  //                                                 MainAxisAlignment.end,
  //                                             children: [
  //                                               Padding(
  //                                                   padding: EdgeInsets.only(
  //                                                       top: 8.v, bottom: 7.v),
  //                                                   child: Text("lbl_cancel".tr,
  //                                                       style: CustomTextStyles
  //                                                           .labelLargeSofiaProBlue800)),
  //                                               _buildCreate()
  //                                             ]))
  //                                   ])))
  //                     ])),
  //                 SizedBox(height: 20.v),
  //                 Padding(
  //                     padding: EdgeInsets.only(left: 1.h),
  //                     child: Obx(() => CustomCheckboxButton(
  //                         text: "lbl_upload_contacts".tr,
  //                         value: controller.uploadContacts.value,
  //                         onChange: (value) {
  //                           controller.uploadContacts.value = value;
  //                         }))),
  //                 SizedBox(height: 20.v),
  //                 Padding(
  //                     padding: EdgeInsets.only(left: 1.h),
  //                     child: Obx(() => CustomCheckboxButton(
  //                         text: "lbl_scan_document".tr,
  //                         value: controller.scanDocument.value,
  //                         onChange: (value) {
  //                           controller.scanDocument.value = value;
  //                         }))),
  //                 SizedBox(height: 20.v),
  //                 Padding(
  //                     padding: EdgeInsets.only(left: 1.h),
  //                     child: Obx(() => CustomCheckboxButton(
  //                         text: "lbl_upload_audio".tr,
  //                         value: controller.uploadAudio.value,
  //                         onChange: (value) {
  //                           controller.uploadAudio.value = value;
  //                         }))),
  //                 SizedBox(height: 20.v),
  //                 Padding(
  //                     padding: EdgeInsets.only(left: 1.h, right: 91.h),
  //                     child: Obx(() => CustomCheckboxButton(
  //                         text: "msg_upload_whatsapp".tr,
  //                         value: controller.uploadWhatsappBackup.value,
  //                         onChange: (value) {
  //                           controller.uploadWhatsappBackup.value = value;
  //                         }))),
  //                 SizedBox(height: 30.v)
  //               ])));
  // }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.to(SettingsScreen());
  }
}
