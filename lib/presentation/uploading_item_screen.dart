import 'package:safebox/controller/uploading_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/presentation/added_folder_one_page.dart';
import 'package:safebox/presentation/starred_files_page.dart';
import 'package:safebox/presentation/starred_folder_page.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_bottom_app_bar.dart';
import 'package:safebox/widgets/custom_checkbox_button.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class UploadingItemScreen extends GetWidget<UploadingItemController> {
  const UploadingItemScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 3.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.h),
                        child: CustomSearchView(
                          controller: controller.searchController,
                          hintText: "msg_search_files_in".tr,
                        ),
                      ),
                      _buildCloseStack(),
                      SizedBox(height: 28.v),
                      _buildRecentFilesRow(),
                      SizedBox(height: 15.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.h),
                          child: Text(
                            "lbl_today".tr,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.v),
                      _buildCarbonFolderRow(),
                      SizedBox(height: 491.v),
                      SizedBox(
                        height: 517.v,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            _buildUploadToSaveboxColumn(),
                            _buildKeyboards1Column(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 30.h),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "lbl_safe".tr,
                style: CustomTextStyles.titleLargeSofiaProIndigo900,
              ),
              TextSpan(
                text: "lbl_box".tr,
                style: CustomTextStyles.headlineMedium_1,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgCiHamburger,
          margin: EdgeInsets.fromLTRB(26.h, 14.v, 26.h, 11.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCloseStack() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: appTheme.orange5001,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Container(
        height: 60.v,
        width: 315.h,
        padding: EdgeInsets.symmetric(
          horizontal: 13.h,
          vertical: 9.v,
        ),
        decoration: AppDecoration.fillOrange.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgCloseOnprimary,
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                    ),
                    SizedBox(height: 5.v),
                    Padding(
                      padding: EdgeInsets.only(right: 2.h),
                      child: Text(
                        "lbl_100".tr,
                        style: CustomTextStyles.labelMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 4.v),
                    Divider(
                      color: appTheme.amberA200,
                      endIndent: 2.h,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 1.v,
                ),
                child: Text(
                  "msg_backup_completed".tr,
                  style: CustomTextStyles.titleSmallOnPrimary,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  bottom: 10.v,
                ),
                child: Text(
                  "lbl_10mb_10mb".tr,
                  style: CustomTextStyles.labelMediumOnPrimaryMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRecentFilesRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "lbl_recent_files".tr,
            style: theme.textTheme.titleMedium,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgGroup109,
            height: 10.v,
            width: 12.h,
            margin: EdgeInsets.only(
              left: 6.h,
              top: 4.v,
              bottom: 3.v,
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgPlus,
            height: 15.adaptSize,
            width: 15.adaptSize,
            margin: EdgeInsets.only(top: 2.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCarbonFolderRow() {
    return Padding(
      padding: EdgeInsets.only(
        left: 28.h,
        right: 25.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgCarbonFolderBlue200,
            height: 36.adaptSize,
            width: 36.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 5.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_my_designs".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 2.v),
                SizedBox(
                  width: 93.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text(
                          "lbl_0_0kb".tr,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Text(
                        "lbl_1_sec_ago".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgInfo,
            height: 26.v,
            width: 22.h,
            margin: EdgeInsets.only(
              top: 4.v,
              bottom: 6.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUploadToSaveboxColumn() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 29.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.customBorderTL30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 156.v,
              width: 316.h,
              margin: EdgeInsets.only(left: 1.h),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.v),
                      child: Text(
                        "lbl_add_to_savebox".tr,
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgClose,
                    height: 10.adaptSize,
                    width: 10.adaptSize,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 25.v),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(
                      () => CustomCheckboxButton(
                        alignment: Alignment.centerLeft,
                        text: "lbl_create_folder".tr,
                        value: controller.createFolder.value,
                        onChange: (value) {
                          controller.createFolder.value = value;
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 35.v),
                      child: Obx(
                        () => CustomCheckboxButton(
                          alignment: Alignment.bottomLeft,
                          text: "lbl_upload_files".tr,
                          value: controller.uploadFiles.value,
                          onChange: (value) {
                            controller.uploadFiles.value = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Obx(
                      () => CustomCheckboxButton(
                        alignment: Alignment.bottomLeft,
                        text: "msg_upload_photos_and".tr,
                        value: controller.uploadPhotosAndVideos.value,
                        onChange: (value) {
                          controller.uploadPhotosAndVideos.value = value;
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(right: 1.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                        vertical: 14.v,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "lbl_new_folder".tr,
                            style: theme.textTheme.labelLarge,
                          ),
                          SizedBox(height: 15.v),
                          Container(
                            width: 275.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.h,
                              vertical: 4.v,
                            ),
                            decoration: AppDecoration.outlineGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 1.v),
                                SizedBox(
                                  width: 80.h,
                                  child: Text(
                                    "lbl_folder_name".tr,
                                    maxLines: null,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.titleSmall!.copyWith(
                                      height: 2.71,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.v),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 8.v,
                                    bottom: 7.v,
                                  ),
                                  child: Text(
                                    "lbl_cancel".tr,
                                    style: CustomTextStyles
                                        .labelLargeSofiaProBlue800,
                                  ),
                                ),
                                CustomElevatedButton(
                                  height: 30.v,
                                  width: 74.h,
                                  text: "lbl_create".tr,
                                  margin: EdgeInsets.only(left: 15.h),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Obx(
                () => CustomCheckboxButton(
                  text: "lbl_upload_contacts".tr,
                  value: controller.uploadContacts.value,
                  onChange: (value) {
                    controller.uploadContacts.value = value;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Obx(
                () => CustomCheckboxButton(
                  text: "lbl_scan_document".tr,
                  value: controller.scanDocument.value,
                  onChange: (value) {
                    controller.scanDocument.value = value;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Obx(
                () => CustomCheckboxButton(
                  text: "lbl_upload_audio".tr,
                  value: controller.uploadAudio.value,
                  onChange: (value) {
                    controller.uploadAudio.value = value;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(
                left: 1.h,
                right: 91.h,
              ),
              child: Obx(
                () => CustomCheckboxButton(
                  text: "msg_upload_whatsapp".tr,
                  value: controller.uploadWhatsappBackup.value,
                  onChange: (value) {
                    controller.uploadWhatsappBackup.value = value;
                  },
                ),
              ),
            ),
            SizedBox(height: 30.v),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildKeyboards1Column() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillBlueGray,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.v,
                    bottom: 12.v,
                  ),
                  child: Text(
                    "lbl_i".tr,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyLargeSFProTextWhiteA700,
                  ),
                ),
                SizedBox(
                  height: 42.v,
                  child: VerticalDivider(
                    width: 1.h,
                    thickness: 1.v,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.v,
                    bottom: 12.v,
                  ),
                  child: Text(
                    "lbl_the".tr,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyLargeSFProTextWhiteA700,
                  ),
                ),
                SizedBox(
                  height: 42.v,
                  child: VerticalDivider(
                    width: 1.h,
                    thickness: 1.v,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.v,
                    bottom: 12.v,
                  ),
                  child: Text(
                    "lbl_i_m".tr,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyLargeSFProTextWhiteA700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 3.h,
              vertical: 10.v,
            ),
            decoration: AppDecoration.fillBlueGrayE,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 31.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_q".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_w".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_e".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_r".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_t".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_y".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_u".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_i".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_o".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_p".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
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
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "lbl_a".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        width: 31.h,
                        margin: EdgeInsets.only(left: 6.h),
                        padding: EdgeInsets.all(7.h),
                        decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "lbl_s".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        width: 31.h,
                        margin: EdgeInsets.only(left: 6.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.h,
                          vertical: 7.v,
                        ),
                        decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "lbl_d".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        width: 31.h,
                        margin: EdgeInsets.only(left: 6.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.h,
                          vertical: 7.v,
                        ),
                        decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "lbl_f".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        width: 31.h,
                        margin: EdgeInsets.only(left: 6.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.h,
                          vertical: 7.v,
                        ),
                        decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "lbl_g".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        width: 31.h,
                        margin: EdgeInsets.only(left: 6.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.h,
                          vertical: 7.v,
                        ),
                        decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "lbl_h".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        width: 31.h,
                        margin: EdgeInsets.only(left: 6.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.h,
                          vertical: 7.v,
                        ),
                        decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "lbl_j".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        width: 31.h,
                        margin: EdgeInsets.only(left: 6.h),
                        padding: EdgeInsets.all(7.h),
                        decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "lbl_k".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        width: 31.h,
                        margin: EdgeInsets.only(left: 6.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.h,
                          vertical: 7.v,
                        ),
                        decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "lbl_l".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowUp,
                      height: 42.adaptSize,
                      width: 42.adaptSize,
                    ),
                    Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 14.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_z".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_x".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_c".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_v".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_b".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_n".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_m".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgCloseBlueGray200,
                      height: 42.adaptSize,
                      width: 42.adaptSize,
                      margin: EdgeInsets.only(left: 14.h),
                    ),
                  ],
                ),
                SizedBox(height: 10.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 42.v,
                      width: 87.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgKey,
                            height: 42.v,
                            width: 87.h,
                            radius: BorderRadius.circular(
                              5.h,
                            ),
                            alignment: Alignment.center,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "lbl_123".tr,
                              textAlign: TextAlign.center,
                              style:
                                  CustomTextStyles.bodyLargeSFProTextBlack900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 184.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.h,
                        vertical: 11.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl_spac".tr,
                              style:
                                  CustomTextStyles.bodyLargeSFProTextBlack900_1,
                            ),
                            TextSpan(
                              text: "lbl_e2".tr,
                              style:
                                  CustomTextStyles.bodyLargeSFProTextBlack900_2,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CustomElevatedButton(
                      width: 87.h,
                      text: "lbl_return".tr,
                      buttonStyle: CustomButtonStyles.outlineBlackTL5,
                      buttonTextStyle:
                          CustomTextStyles.bodyLargeSFProTextBlack900,
                    ),
                  ],
                ),
                SizedBox(height: 28.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 21.h,
                    right: 27.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgEmoji,
                        height: 26.adaptSize,
                        width: 26.adaptSize,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgMap,
                        height: 25.v,
                        width: 15.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.v),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomAppBar() {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {
        Get.toNamed(getCurrentRoute(type), id: 1);
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.starredFolderPage;
      case BottomBarEnum.Files:
        return AppRoutes.addedFolderOnePage;
      case BottomBarEnum.Starred:
        return AppRoutes.starredFilesPage;
      case BottomBarEnum.Account:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.starredFolderPage:
        return StarredFolderPage();
      case AppRoutes.addedFolderOnePage:
        return AddedFolderOnePage();
      case AppRoutes.starredFilesPage:
        return StarredFilesPage();
      default:
        return DefaultWidget();
    }
  }
}
