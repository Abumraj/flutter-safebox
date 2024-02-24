import 'package:safebox/controller/uploading_item_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class UploadingItemOneScreen extends GetWidget<UploadingItemOneController> {
  const UploadingItemOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
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
                    _buildBackupInProgress(),
                    SizedBox(height: 28.v),
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
                    SizedBox(height: 10.v),
                    _buildCarbonFolder(),
                    SizedBox(height: 491.v),
                  ],
                ),
              ),
            ),
          ],
        ),
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
  Widget _buildBackupInProgress() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.h),
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillOrange.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "msg_backup_in_progress".tr,
                    style: CustomTextStyles.titleSmallOnPrimary,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgCloseOnprimary,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ],
            ),
          ),
          SizedBox(height: 5.v),
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_3mb_10mb".tr,
                  style: CustomTextStyles.labelMediumOnPrimaryContainer,
                ),
                Text(
                  "lbl_30".tr,
                  style: CustomTextStyles.labelMediumOnPrimaryContainer,
                ),
              ],
            ),
          ),
          SizedBox(height: 4.v),
          Container(
            height: 5.v,
            width: 285.h,
            decoration: BoxDecoration(
              color: appTheme.whiteA700,
              borderRadius: BorderRadius.circular(
                2.h,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                2.h,
              ),
              child: LinearProgressIndicator(
                value: 0.19,
                backgroundColor: appTheme.whiteA700,
                valueColor: AlwaysStoppedAnimation<Color>(
                  appTheme.amberA200,
                ),
              ),
            ),
          ),
          SizedBox(height: 1.v),
        ],
      ),
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
          const Spacer(),
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
  Widget _buildCarbonFolder() {
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
          const Spacer(),
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
}
