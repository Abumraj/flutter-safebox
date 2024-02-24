import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:safebox/controller/upgrade_storage_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_checkbox_button.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_icon_button.dart';
import 'package:safebox/widgets/custom_radio_button.dart';

class UpgradeStorageScreen extends GetWidget<UpgradeStorageController> {
  UpgradeStorageScreen({Key? key}) : super(key: key);
  final UpgradeStorageController upgradeStorageController =
      Get.put(UpgradeStorageController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 34.v),
                    child: Column(children: [
                      _buildFreeRow(),
                      SizedBox(height: 20.v),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 113.h),
                          decoration: AppDecoration.outlineAmberA.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 15.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: 16.adaptSize,
                                                  width: 16.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      top: 11.v),
                                                  decoration: BoxDecoration(
                                                      color: appTheme.whiteA700,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.h),
                                                      border: Border.all(
                                                          color: appTheme
                                                              .gray40001,
                                                          width: 1.h))),
                                              _buildGoldButton()
                                            ]))),
                                SizedBox(height: 11.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 15.h),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "lbl_2400".tr,
                                              style: theme
                                                  .textTheme.headlineSmall),
                                          TextSpan(
                                              text: "lbl_mo".tr,
                                              style: CustomTextStyles
                                                  .titleMediumOnPrimaryContainer)
                                        ]),
                                        textAlign: TextAlign.left)),
                                SizedBox(height: 13.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 15.h),
                                    child: Row(children: [
                                      Container(
                                          height: 10.adaptSize,
                                          width: 10.adaptSize,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.h, vertical: 1.v),
                                          decoration: AppDecoration
                                              .outlineIndigo
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder5),
                                          child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgRectangle4175,
                                              height: 3.adaptSize,
                                              width: 3.adaptSize,
                                              alignment: Alignment.topCenter)),
                                      Padding(
                                          padding: EdgeInsets.only(left: 5.h),
                                          child: Text("lbl_no_ads2".tr,
                                              style:
                                                  theme.textTheme.labelMedium))
                                    ])),
                                SizedBox(height: 10.v),
                                _buildRadioGroup(),
                                SizedBox(height: 15.v)
                              ])),
                      SizedBox(height: 60.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 30.h),
                              child: Text("lbl_payment_method".tr,
                                  style: theme.textTheme.headlineSmall))),
                      SizedBox(height: 19.v),
                      Padding(
                          padding: EdgeInsets.only(left: 30.h),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 30.h),
                                  child: DottedBorder(
                                      color: appTheme.indigo900,
                                      padding: EdgeInsets.only(
                                          left: 1.h,
                                          top: 1.v,
                                          right: 1.h,
                                          bottom: 1.v),
                                      strokeWidth: 1.h,
                                      radius: Radius.circular(25),
                                      borderType: BorderType.RRect,
                                      dashPattern: [3, 3],
                                      child: CustomIconButton(
                                          height: 50.adaptSize,
                                          width: 50.adaptSize,
                                          padding: EdgeInsets.all(16.h),
                                          decoration: IconButtonStyleHelper
                                              .outlineIndigo,
                                          child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgPlusIndigo900)))))),
                      SizedBox(height: 141.v),
                      _buildPayButton(),
                      SizedBox(height: 60.v),
                    ])))));
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
            text: "lbl_upgrade".tr, margin: EdgeInsets.only(left: 10.h)));
  }

  /// Section Widget
  Widget _buildFreeButton() {
    return CustomElevatedButton(
        height: 23.v,
        width: 61.h,
        text: "lbl_free".tr,
        margin: EdgeInsets.only(bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillGreen);
  }

  /// Section Widget
  Widget _buildSilverButton() {
    return CustomElevatedButton(
        height: 23.v,
        width: 61.h,
        text: "lbl_silver".tr,
        margin: EdgeInsets.only(bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillBlueBL5);
  }

  /// Section Widget
  Widget _buildFreeRow() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              decoration: AppDecoration.outlineGreen
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            width: 133.h,
                            margin: EdgeInsets.only(left: 15.h),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 11.v),
                                      padding: EdgeInsets.all(1.h),
                                      decoration: AppDecoration.outlineBlue200
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder10),
                                      child: Container(
                                          height: 10.adaptSize,
                                          width: 10.adaptSize,
                                          decoration: BoxDecoration(
                                              color: appTheme.blue800,
                                              borderRadius:
                                                  BorderRadius.circular(5.h),
                                              border: Border.all(
                                                  color: appTheme.blue800,
                                                  width: 1.h)))),
                                  _buildFreeButton()
                                ]))),
                    SizedBox(height: 12.v),
                    Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "lbl_0".tr,
                                  style: theme.textTheme.headlineSmall),
                              TextSpan(
                                  text: "lbl_mo".tr,
                                  style: CustomTextStyles
                                      .titleMediumOnPrimaryContainer)
                            ]),
                            textAlign: TextAlign.left)),
                    SizedBox(height: 12.v),
                    Obx(() => Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: CustomRadioButton(
                            text: "lbl_10_gb_storage".tr,
                            value: "lbl_10_gb_storage".tr,
                            groupValue: controller.radioGroup.value,
                            onChange: (value) {
                              controller.radioGroup.value = value;
                            }))),
                    SizedBox(height: 34.v)
                  ])),
          Container(
              margin: EdgeInsets.only(left: 19.h),
              decoration: AppDecoration.outlineBlue800
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            width: 120.h,
                            margin: EdgeInsets.only(left: 12.h),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 16.adaptSize,
                                      width: 16.adaptSize,
                                      margin: EdgeInsets.only(top: 11.v),
                                      decoration: BoxDecoration(
                                          color: appTheme.whiteA700,
                                          borderRadius:
                                              BorderRadius.circular(8.h),
                                          border: Border.all(
                                              color: appTheme.gray40001,
                                              width: 1.h))),
                                  _buildSilverButton()
                                ]))),
                    SizedBox(height: 11.v),
                    Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "lbl_1200".tr,
                                  style: theme.textTheme.headlineSmall),
                              TextSpan(
                                  text: "lbl_mo".tr,
                                  style: CustomTextStyles
                                      .titleMediumOnPrimaryContainer)
                            ]),
                            textAlign: TextAlign.left)),
                    SizedBox(height: 13.v),
                    Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: Row(children: [
                          Container(
                              height: 10.adaptSize,
                              width: 10.adaptSize,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.h, vertical: 1.v),
                              decoration: AppDecoration.outlineIndigo.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgRectangle4175,
                                  height: 3.adaptSize,
                                  width: 3.adaptSize,
                                  alignment: Alignment.topCenter)),
                          Padding(
                              padding: EdgeInsets.only(left: 5.h),
                              child: Text("lbl_no_ads".tr,
                                  style: theme.textTheme.labelMedium))
                        ])),
                    SizedBox(height: 10.v),
                    Obx(() => Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: CustomRadioButton(
                            text: "lbl_50_gb_storage".tr,
                            value: "lbl_50_gb_storage".tr,
                            groupValue: controller.radioGroup1.value,
                            onChange: (value) {
                              controller.radioGroup1.value = value;
                            }))),
                    SizedBox(height: 14.v)
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildGoldButton() {
    return CustomElevatedButton(
        height: 23.v,
        width: 61.h,
        text: "lbl_gold".tr,
        margin: EdgeInsets.only(bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillAmberA);
  }

  /// Section Widget
  Widget _buildRadioGroup() {
    return Padding(
        padding: EdgeInsets.only(left: 15.h),
        child: Obx(() => Column(children: [
              Padding(
                  padding: EdgeInsets.only(right: 23.h),
                  child: CustomRadioButton(
                      text: "lbl_50_gb_storage".tr,
                      value: controller
                          .upgradeStorageModelObj.value.radioList.value[0],
                      groupValue: controller.radioGroup2.value,
                      onChange: (value) {
                        controller.radioGroup2.value = value;
                      })),
              Padding(
                  padding: EdgeInsets.only(top: 8.v),
                  child: CustomRadioButton(
                      text: "msg_get_paid_on_referral".tr,
                      value: controller
                          .upgradeStorageModelObj.value.radioList.value[1],
                      groupValue: controller.radioGroup2.value,
                      onChange: (value) {
                        controller.radioGroup2.value = value;
                      }))
            ])));
  }

  /// Section Widget
  Widget _buildPayButton() {
    return CustomElevatedButton(
        height: 50.v,
        text: "lbl_pay".tr,
        margin: EdgeInsets.symmetric(horizontal: 30.h),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL5,
        buttonTextStyle: CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold);
  }

  /// Section Widget
  Widget _buildCreateButton() {
    return CustomElevatedButton(
        height: 30.v,
        width: 74.h,
        text: "lbl_create".tr,
        margin: EdgeInsets.only(left: 15.h));
  }

  /// Section Widget
  Widget _buildUploadToSaveboxColumn() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 29.h),
            decoration:
                BoxDecoration(borderRadius: BorderRadiusStyle.customBorderTL30),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 156.v,
                      width: 316.h,
                      margin: EdgeInsets.only(left: 1.h),
                      child: Stack(alignment: Alignment.topRight, children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 20.v),
                                child: Text("lbl_add_to_savebox".tr,
                                    style: theme.textTheme.labelLarge))),
                        CustomImageView(
                            imagePath: ImageConstant.imgClose,
                            height: 10.adaptSize,
                            width: 10.adaptSize,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 25.v)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Obx(() => CustomCheckboxButton(
                                alignment: Alignment.centerLeft,
                                text: "lbl_create_folder".tr,
                                value: controller.createFolder.value,
                                onChange: (value) {
                                  controller.createFolder.value = value;
                                }))),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 35.v),
                                child: Obx(() => CustomCheckboxButton(
                                    alignment: Alignment.bottomLeft,
                                    text: "lbl_upload_files".tr,
                                    value: controller.uploadFiles.value,
                                    onChange: (value) {
                                      controller.uploadFiles.value = value;
                                    })))),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Obx(() => CustomCheckboxButton(
                                alignment: Alignment.bottomLeft,
                                text: "msg_upload_photos_and".tr,
                                value: controller.uploadPhotosAndVideos.value,
                                onChange: (value) {
                                  controller.uploadPhotosAndVideos.value =
                                      value;
                                }))),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                margin: EdgeInsets.only(right: 1.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.h, vertical: 14.v),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder10),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("lbl_new_folder".tr,
                                          style: theme.textTheme.labelLarge),
                                      SizedBox(height: 15.v),
                                      Container(
                                          width: 275.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 14.h, vertical: 4.v),
                                          decoration: AppDecoration.outlineGray
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder5),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 1.v),
                                                SizedBox(
                                                    width: 80.h,
                                                    child: Text(
                                                        "lbl_folder_name".tr,
                                                        maxLines: null,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: theme.textTheme
                                                            .titleSmall!
                                                            .copyWith(
                                                                height: 2.71)))
                                              ])),
                                      SizedBox(height: 20.v),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 8.v, bottom: 7.v),
                                                    child: Text("lbl_cancel".tr,
                                                        style: CustomTextStyles
                                                            .labelLargeSofiaProBlue800)),
                                                _buildCreateButton()
                                              ]))
                                    ])))
                      ])),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: Obx(() => CustomCheckboxButton(
                          text: "lbl_upload_contacts".tr,
                          value: controller.uploadContacts.value,
                          onChange: (value) {
                            controller.uploadContacts.value = value;
                          }))),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: Obx(() => CustomCheckboxButton(
                          text: "lbl_scan_document".tr,
                          value: controller.scanDocument.value,
                          onChange: (value) {
                            controller.scanDocument.value = value;
                          }))),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: Obx(() => CustomCheckboxButton(
                          text: "lbl_upload_audio".tr,
                          value: controller.uploadAudio.value,
                          onChange: (value) {
                            controller.uploadAudio.value = value;
                          }))),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h, right: 91.h),
                      child: Obx(() => CustomCheckboxButton(
                          text: "msg_upload_whatsapp".tr,
                          value: controller.uploadWhatsappBackup.value,
                          onChange: (value) {
                            controller.uploadWhatsappBackup.value = value;
                          }))),
                  SizedBox(height: 30.v)
                ])));
  }

  /// Section Widget
  Widget _buildReturnButton() {
    return CustomElevatedButton(
        width: 87.h,
        text: "lbl_return".tr,
        buttonStyle: CustomButtonStyles.outlineBlackTL5,
        buttonTextStyle: CustomTextStyles.bodyLargeSFProTextBlack900);
  }

  /// Section Widget
  Widget _buildKeyboards1Column() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillBlueGray,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 8.v, bottom: 12.v),
                        child: Text("lbl_i".tr,
                            textAlign: TextAlign.center,
                            style:
                                CustomTextStyles.bodyLargeSFProTextWhiteA700)),
                    SizedBox(
                        height: 42.v,
                        child: VerticalDivider(width: 1.h, thickness: 1.v)),
                    Padding(
                        padding: EdgeInsets.only(top: 8.v, bottom: 12.v),
                        child: Text("lbl_the".tr,
                            textAlign: TextAlign.center,
                            style:
                                CustomTextStyles.bodyLargeSFProTextWhiteA700)),
                    SizedBox(
                        height: 42.v,
                        child: VerticalDivider(width: 1.h, thickness: 1.v)),
                    Padding(
                        padding: EdgeInsets.only(top: 8.v, bottom: 12.v),
                        child: Text("lbl_i_m".tr,
                            textAlign: TextAlign.center,
                            style:
                                CustomTextStyles.bodyLargeSFProTextWhiteA700))
                  ])),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 10.v),
              decoration: AppDecoration.fillBlueGrayE,
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_q".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_w".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_e".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.all(7.h),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_r".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_t".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.all(7.h),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_y".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.all(7.h),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_u".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_i".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_o".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.all(7.h),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_p".tr,
                              style: theme.textTheme.titleLarge))
                    ]),
                SizedBox(height: 12.v),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.h),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 31.h,
                              padding: EdgeInsets.all(7.h),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_a".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.all(7.h),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_s".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_d".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_f".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_g".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_h".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_j".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.all(7.h),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_k".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_l".tr,
                                  style: theme.textTheme.titleLarge))
                        ])),
                SizedBox(height: 12.v),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgArrowUp,
                      height: 42.adaptSize,
                      width: 42.adaptSize),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 14.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_z".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_x".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_c".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_v".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_b".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_n".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.h, vertical: 7.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_m".tr, style: theme.textTheme.titleLarge)),
                  CustomImageView(
                      imagePath: ImageConstant.imgCloseBlueGray200,
                      height: 42.adaptSize,
                      width: 42.adaptSize,
                      margin: EdgeInsets.only(left: 14.h))
                ]),
                SizedBox(height: 10.v),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 42.v,
                          width: 87.h,
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgKey,
                                height: 42.v,
                                width: 87.h,
                                radius: BorderRadius.circular(5.h),
                                alignment: Alignment.center),
                            Align(
                                alignment: Alignment.center,
                                child: Text("lbl_123".tr,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles
                                        .bodyLargeSFProTextBlack900))
                          ])),
                      Container(
                          width: 184.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.h, vertical: 11.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_spac".tr,
                                    style: CustomTextStyles
                                        .bodyLargeSFProTextBlack900_1),
                                TextSpan(
                                    text: "lbl_e2".tr,
                                    style: CustomTextStyles
                                        .bodyLargeSFProTextBlack900_2)
                              ]),
                              textAlign: TextAlign.center)),
                      _buildReturnButton()
                    ]),
                SizedBox(height: 28.v),
                Padding(
                    padding: EdgeInsets.only(left: 21.h, right: 27.h),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgEmoji,
                              height: 26.adaptSize,
                              width: 26.adaptSize),
                          CustomImageView(
                              imagePath: ImageConstant.imgMap,
                              height: 25.v,
                              width: 15.h)
                        ])),
                SizedBox(height: 14.v)
              ]))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
