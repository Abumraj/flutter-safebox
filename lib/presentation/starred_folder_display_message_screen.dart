import 'package:flutter/material.dart';
import 'package:safebox/controller/starred_folder_display_message_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/presentation/added_folder_one_page.dart';
import 'package:safebox/presentation/starred_files_page.dart';
import 'package:safebox/presentation/starred_folder_page.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_bottom_app_bar.dart';
import 'package:safebox/widgets/custom_checkbox_button.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_icon_button.dart';
import 'package:safebox/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class StarredFolderDisplayMessageScreen
    extends GetWidget<StarredFolderDisplayMessageController> {
  const StarredFolderDisplayMessageScreen({Key? key})
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
                      SizedBox(height: 38.v),
                      _buildRecentFiles(),
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
                      SizedBox(height: 14.v),
                      _buildFolderRow(),
                      SizedBox(height: 409.v),
                      SizedBox(
                        height: 64.v,
                        width: 213.h,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            CustomIconButton(
                              height: 64.adaptSize,
                              width: 64.adaptSize,
                              padding: EdgeInsets.all(15.h),
                              decoration: IconButtonStyleHelper.fillBlue,
                              alignment: Alignment.center,
                              child: CustomImageView(
                                imagePath:
                                    ImageConstant.imgAntDesignPlusOutlined,
                              ),
                            ),
                            _buildStarredSuccessfullyButton(),
                          ],
                        ),
                      ),
                      SizedBox(height: 48.v),
                      SizedBox(
                        height: 537.v,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            _buildUploadToSaveboxColumn(),
                            _buildKeyboardColumn(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 19.h,
                                  vertical: 15.v,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL30,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildCarbonFolder(),
                                    SizedBox(height: 30.v),
                                    Padding(
                                      padding: EdgeInsets.only(left: 11.h),
                                      child: _buildFluentCopyFilled(
                                        userImage:
                                            ImageConstant.imgAkarIconsInfoFill,
                                        userLabel: "lbl_information".tr,
                                      ),
                                    ),
                                    SizedBox(height: 30.v),
                                    Padding(
                                      padding: EdgeInsets.only(left: 11.h),
                                      child: Row(
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgBookmark,
                                            height: 16.adaptSize,
                                            width: 16.adaptSize,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.h),
                                            child: Text(
                                              "lbl_star".tr,
                                              style: theme.textTheme.bodyLarge,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 30.v),
                                    Padding(
                                      padding: EdgeInsets.only(left: 11.h),
                                      child: Row(
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgIcRoundDrive,
                                            height: 16.adaptSize,
                                            width: 16.adaptSize,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.h),
                                            child: Text(
                                              "lbl_rename".tr,
                                              style: theme.textTheme.bodyLarge,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 30.v),
                                    Padding(
                                      padding: EdgeInsets.only(left: 11.h),
                                      child: _buildBxsContact(
                                        userImage:
                                            ImageConstant.imgIcRoundRestorePage,
                                        uploadContactsLabel:
                                            "msg_restore_to_device".tr,
                                      ),
                                    ),
                                    SizedBox(height: 30.v),
                                    Padding(
                                      padding: EdgeInsets.only(left: 11.h),
                                      child: _buildScanDocument(
                                        userImage:
                                            ImageConstant.imgBiArrowsMove,
                                        scanDocumentText: "lbl_move_to".tr,
                                      ),
                                    ),
                                    SizedBox(height: 30.v),
                                    Padding(
                                      padding: EdgeInsets.only(left: 11.h),
                                      child: _buildFluentCopyFilled(
                                        userImage:
                                            ImageConstant.imgFluentCopy24Filled,
                                        userLabel: "lbl_copy".tr,
                                      ),
                                    ),
                                    SizedBox(height: 30.v),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.h),
                                      child: Row(
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant
                                                .imgFluentDelete28Filled,
                                            height: 17.adaptSize,
                                            width: 17.adaptSize,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 10.h,
                                              top: 3.v,
                                            ),
                                            child: Text(
                                              "lbl_delete".tr,
                                              style: theme.textTheme.bodyLarge,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15.v),
                                  ],
                                ),
                              ),
                            ),
                            _buildUploadToSaveboxColumn1(),
                            _buildInformationColumn(),
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
  Widget _buildRecentFiles() {
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
  Widget _buildFolderRow() {
    return Padding(
      padding: EdgeInsets.only(
        left: 30.h,
        right: 25.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 27.v,
            width: 31.h,
            margin: EdgeInsets.only(bottom: 5.v),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgFolder,
                  height: 27.v,
                  width: 31.h,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 24.v,
                    width: 29.h,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgFolderBlue200,
                          height: 24.v,
                          width: 29.h,
                          alignment: Alignment.center,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgBookmarkBlue800,
                          height: 10.adaptSize,
                          width: 10.adaptSize,
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(
                            right: 1.h,
                            bottom: 1.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_my_designs".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 2.v),
                _buildFilesize(
                  fileSize: "lbl_0_0kb".tr,
                  time: "lbl_1_sec_ago".tr,
                ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgInfo,
            height: 26.v,
            width: 22.h,
            margin: EdgeInsets.only(bottom: 6.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStarredSuccessfullyButton() {
    return CustomElevatedButton(
      height: 50.v,
      width: 213.h,
      text: "msg_starred_successfully".tr,
      buttonStyle: CustomButtonStyles.outlineBlueTL10,
      buttonTextStyle: CustomTextStyles.titleSmallBlue800,
      alignment: Alignment.topCenter,
    );
  }

  /// Section Widget
  Widget _buildCreateButton() {
    return CustomElevatedButton(
      height: 30.v,
      width: 74.h,
      text: "lbl_create".tr,
      margin: EdgeInsets.only(left: 15.h),
    );
  }

  /// Section Widget
  Widget _buildUploadToSaveboxColumn() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 20.v),
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
                                _buildCreateButton(),
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
  Widget _buildKButton() {
    return CustomElevatedButton(
      width: 31.h,
      text: "lbl_k".tr,
      margin: EdgeInsets.only(left: 6.h),
      buttonStyle: CustomButtonStyles.outlineBlack,
      buttonTextStyle: theme.textTheme.titleLarge!,
    );
  }

  /// Section Widget
  Widget _buildLButton() {
    return CustomElevatedButton(
      width: 31.h,
      text: "lbl_l".tr,
      margin: EdgeInsets.only(left: 6.h),
      buttonStyle: CustomButtonStyles.outlineBlack,
      buttonTextStyle: theme.textTheme.titleLarge!,
    );
  }

  /// Section Widget
  Widget _buildReturnButton() {
    return CustomElevatedButton(
      width: 87.h,
      text: "lbl_return".tr,
      buttonStyle: CustomButtonStyles.outlineBlackTL5,
      buttonTextStyle: CustomTextStyles.bodyLargeSFProTextBlack900,
    );
  }

  /// Section Widget
  Widget _buildKeyboardColumn() {
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_q".tr,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_w".tr,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_e".tr,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_r".tr,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 7.v,
                      ),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_t".tr,
                        textAlign: TextAlign.center,
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
                        padding: EdgeInsets.all(7.h),
                        decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "lbl_a".tr,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 6.h),
                        padding: EdgeInsets.all(7.h),
                        decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "lbl_s".tr,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
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
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
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
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
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
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
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
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Container(
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
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      _buildKButton(),
                      _buildLButton(),
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
                      margin: EdgeInsets.only(left: 14.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_z".tr,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "lbl_x".tr,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
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
                        textAlign: TextAlign.center,
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
                    _buildReturnButton(),
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
  Widget _buildCarbonFolder() {
    return Padding(
      padding: EdgeInsets.only(left: 11.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgCarbonFolder,
            height: 36.adaptSize,
            width: 36.adaptSize,
            margin: EdgeInsets.only(top: 8.v),
          ),
          Container(
            height: 37.v,
            width: 93.h,
            margin: EdgeInsets.only(
              left: 10.h,
              top: 6.v,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "lbl_my_designs".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.v),
                  child: _buildFilesize(
                    fileSize: "lbl_0_0kb".tr,
                    time: "lbl_1_sec_ago".tr,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRightOnprimary,
            height: 30.adaptSize,
            width: 30.adaptSize,
            margin: EdgeInsets.only(bottom: 14.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUploadToSaveboxColumn1() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(
          horizontal: 19.h,
          vertical: 15.v,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.customBorderTL30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: _buildInformation(
                userText: "lbl_add_to_savebox".tr,
              ),
            ),
            SizedBox(height: 26.v),
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: _buildFluentCopyFilled(
                userImage: ImageConstant.imgIcRoundCreateNewFolder,
                userLabel: "lbl_create_folder".tr,
              ),
            ),
            SizedBox(height: 30.v),
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: _buildFluentCopyFilled(
                userImage: ImageConstant.imgBxsCloudUpload,
                userLabel: "lbl_upload_files".tr,
              ),
            ),
            SizedBox(height: 30.v),
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFolderOnprimarycontainer,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "msg_upload_photos_and".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.v),
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: _buildBxsContact(
                userImage: ImageConstant.imgBxsContact,
                uploadContactsLabel: "lbl_upload_contacts".tr,
              ),
            ),
            SizedBox(height: 30.v),
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: _buildScanDocument(
                userImage: ImageConstant.imgFluentScanCamera16Filled,
                scanDocumentText: "lbl_scan_document".tr,
              ),
            ),
            SizedBox(height: 30.v),
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: _buildFluentCopyFilled(
                userImage: ImageConstant.imgAntDesignAudioFilled,
                userLabel: "lbl_upload_audio".tr,
              ),
            ),
            SizedBox(height: 30.v),
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFluentDocument,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "msg_upload_whatsapp".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.v),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildInformationColumn() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 57.v),
        padding: EdgeInsets.symmetric(
          horizontal: 19.h,
          vertical: 15.v,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.customBorderTL30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: _buildInformation(
                userText: "lbl_information".tr,
              ),
            ),
            SizedBox(height: 28.v),
            Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  Text(
                    "lbl_title".tr,
                    style: CustomTextStyles.titleMediumOnPrimaryContainer_1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_my_designs".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  Text(
                    "lbl_format".tr,
                    style: CustomTextStyles.titleMediumOnPrimaryContainer_1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_folder".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: _buildFilesize(
                fileSize: "lbl_size".tr,
                time: "lbl_0_0kb".tr,
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(
                left: 11.h,
                right: 87.h,
              ),
              child: Row(
                children: [
                  Text(
                    "lbl_date".tr,
                    style: CustomTextStyles.titleMediumOnPrimaryContainer_1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "msg_march_24_2022".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  Text(
                    "lbl_location".tr,
                    style: CustomTextStyles.titleMediumOnPrimaryContainer_1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_cloud".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.v),
          ],
        ),
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

  /// Common widget
  Widget _buildFilesize({
    required String fileSize,
    required String time,
  }) {
    return SizedBox(
      width: 93.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fileSize,
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            ),
          ),
          Text(
            time,
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFluentCopyFilled({
    required String userImage,
    required String userLabel,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: userImage,
          height: 16.adaptSize,
          width: 16.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Text(
            userLabel,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildBxsContact({
    required String userImage,
    required String uploadContactsLabel,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: userImage,
          height: 16.adaptSize,
          width: 16.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Text(
            uploadContactsLabel,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildScanDocument({
    required String userImage,
    required String scanDocumentText,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: userImage,
          height: 16.adaptSize,
          width: 16.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Text(
            scanDocumentText,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildInformation({required String userText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 5.v,
            bottom: 2.v,
          ),
          child: Text(
            userText,
            style: CustomTextStyles.titleSmallOnPrimaryContainer.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRightOnprimary,
          height: 30.adaptSize,
          width: 30.adaptSize,
        ),
      ],
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
