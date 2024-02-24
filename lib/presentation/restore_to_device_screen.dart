import 'package:safebox/controller/restore_to_device_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image_one.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_checkbox_button.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';

class RestoreToDeviceScreen extends GetWidget<RestoreToDeviceController> {
  RestoreToDeviceScreen({Key? key}) : super(key: key);
  final RestoreToDeviceController restoreToDeviceController =
      Get.put(RestoreToDeviceController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 12.v),
                    child: Column(children: [
                      _buildCarbonFolderStack(),
                      SizedBox(height: 14.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 28.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgCarbonFolderGray40001,
                                    height: 36.adaptSize,
                                    width: 36.adaptSize),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.h, top: 8.v, bottom: 7.v),
                                    child: Text("lbl_bluetooth".tr,
                                        style: CustomTextStyles
                                            .titleLargeSofiaProOnPrimary))
                              ]))),
                      SizedBox(height: 19.v),
                      Divider(color: appTheme.gray200),
                      SizedBox(height: 14.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 28.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgCarbonFolderGray40001,
                                    height: 36.adaptSize,
                                    width: 36.adaptSize),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.h, top: 9.v, bottom: 6.v),
                                    child: Text("lbl_dcim".tr,
                                        style: CustomTextStyles
                                            .titleLargeSofiaProOnPrimary))
                              ]))),
                      SizedBox(height: 19.v),
                      Divider(color: appTheme.gray200),
                      SizedBox(height: 14.v),
                      Padding(
                          padding: EdgeInsets.only(left: 28.h),
                          child: _buildCarbonFolder(
                              userName: "lbl_documents2".tr)),
                      SizedBox(height: 19.v),
                      Divider(color: appTheme.gray200),
                      SizedBox(height: 14.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 28.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgCarbonFolderGray40001,
                                    height: 36.adaptSize,
                                    width: 36.adaptSize),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.h, top: 8.v, bottom: 7.v),
                                    child: Text("lbl_download".tr,
                                        style: CustomTextStyles
                                            .titleLargeSofiaProOnPrimary))
                              ]))),
                      SizedBox(height: 19.v),
                      Divider(color: appTheme.gray200),
                      SizedBox(height: 14.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 28.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgCarbonFolderGray40001,
                                    height: 36.adaptSize,
                                    width: 36.adaptSize),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.h, top: 9.v, bottom: 6.v),
                                    child: Text("lbl_fonts".tr,
                                        style: CustomTextStyles
                                            .titleLargeSofiaProOnPrimary))
                              ]))),
                      SizedBox(height: 19.v),
                      Divider(color: appTheme.gray200),
                      SizedBox(height: 14.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 28.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgCarbonFolderGray40001,
                                    height: 36.adaptSize,
                                    width: 36.adaptSize),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.h, top: 9.v, bottom: 6.v),
                                    child: Text("lbl_music".tr,
                                        style: CustomTextStyles
                                            .titleLargeSofiaProOnPrimary))
                              ]))),
                      SizedBox(height: 34.v),
                      _buildRestoreStack(),
                      SizedBox(height: 20.v),
                      SizedBox(
                          height: 517.v,
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                _buildUploadToSaveboxColumn(),
                                _buildKeyboards1Column()
                              ]))
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 12.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitleOne(
            text: "msg_internal_storage".tr,
            margin: EdgeInsets.only(top: 4.v, right: 28.h, bottom: 3.v)),
        actions: [
          AppbarTrailingImageOne(
              imagePath: ImageConstant.imgArrowDown,
              margin: EdgeInsets.only(left: 143.h))
        ]);
  }

  /// Section Widget
  Widget _buildCarbonFolderStack() {
    return SizedBox(
        height: 126.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 28.h),
                        child: Row(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgCarbonFolderGray40001,
                              height: 36.adaptSize,
                              width: 36.adaptSize),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 10.h, top: 8.v, bottom: 7.v),
                              child: Text("lbl_alarms".tr,
                                  style: CustomTextStyles
                                      .titleLargeSofiaProOnPrimary))
                        ])),
                    SizedBox(height: 19.v),
                    Divider(color: appTheme.gray200)
                  ])),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.h, vertical: 15.v),
                    decoration: AppDecoration.fillBlue5001,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgCarbonFolderBlue200,
                              height: 36.adaptSize,
                              width: 36.adaptSize,
                              margin: EdgeInsets.only(bottom: 4.v)),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 10.h, top: 8.v, bottom: 11.v),
                              child: Text("lbl_android".tr,
                                  style: CustomTextStyles
                                      .titleLargeSofiaProOnPrimary))
                        ])),
                Divider(color: appTheme.indigo50)
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildRestoreStack() {
    return SizedBox(
        height: 137.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 28.h),
                        child:
                            _buildCarbonFolder(userName: "lbl_myalbulms".tr)),
                    SizedBox(height: 19.v),
                    Divider(color: appTheme.gray200)
                  ])),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 11.v),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 28.h),
                            child: Row(children: [
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgCarbonFolderGray40001,
                                  height: 36.adaptSize,
                                  width: 36.adaptSize),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.h, top: 8.v, bottom: 7.v),
                                  child: Text("lbl_pictures".tr,
                                      style: CustomTextStyles
                                          .titleLargeSofiaProOnPrimaryMedium))
                            ])),
                        SizedBox(height: 19.v),
                        Divider(color: appTheme.gray200)
                      ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: 55.v),
                  padding:
                      EdgeInsets.symmetric(horizontal: 38.h, vertical: 23.v),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 9.v, bottom: 10.v),
                            child: Text("lbl_cancel".tr,
                                style: CustomTextStyles.titleMediumBlue800)),
                        CustomElevatedButton(
                            height: 35.v,
                            width: 99.h,
                            text: "lbl_restore".tr,
                            margin: EdgeInsets.only(left: 20.h, top: 1.v),
                            buttonTextStyle:
                                CustomTextStyles.titleMediumWhiteA700)
                      ])))
        ]));
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
                                                CustomElevatedButton(
                                                    height: 30.v,
                                                    width: 74.h,
                                                    text: "lbl_create".tr,
                                                    margin: EdgeInsets.only(
                                                        left: 15.h))
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
                      CustomElevatedButton(
                          width: 87.h,
                          text: "lbl_return".tr,
                          buttonStyle: CustomButtonStyles.outlineBlackTL5,
                          buttonTextStyle:
                              CustomTextStyles.bodyLargeSFProTextBlack900)
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

  /// Common widget
  Widget _buildCarbonFolder({required String userName}) {
    return Row(children: [
      CustomImageView(
          imagePath: ImageConstant.imgCarbonFolderGray40001,
          height: 36.adaptSize,
          width: 36.adaptSize),
      Padding(
          padding: EdgeInsets.only(left: 10.h, top: 11.v, bottom: 4.v),
          child: Text(userName,
              style: CustomTextStyles.titleLargeSofiaProOnPrimary
                  .copyWith(color: theme.colorScheme.onPrimary)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
