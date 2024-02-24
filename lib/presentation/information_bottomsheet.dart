import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/userfiles_item_model.dart';

// ignore_for_file: must_be_immutable
class InformationBottomsheet extends StatelessWidget {
  final UserfilesItemModel item;
  const InformationBottomsheet({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 29.h, vertical: 22.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("lbl_information".tr,
                            style:
                                CustomTextStyles.titleSmallOnPrimaryContainer),
                        CustomImageView(
                            imagePath: ImageConstant.imgClose,
                            height: 10.adaptSize,
                            width: 10.adaptSize,
                            margin: EdgeInsets.symmetric(vertical: 2.v),
                            onTap: () {
                              onTapImgClose();
                            })
                      ])),
              SizedBox(height: 32.v),
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text("lbl_title".tr,
                            style: CustomTextStyles
                                .titleMediumOnPrimaryContainer_1)),
                    Padding(
                        padding: EdgeInsets.only(left: 43.h),
                        child: Text(item.name!.tr,
                            style: theme.textTheme.titleMedium))
                  ])),
              SizedBox(height: 16.v),
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Row(children: [
                    Text("lbl_format".tr,
                        style:
                            CustomTextStyles.titleMediumOnPrimaryContainer_1),
                    Padding(
                        padding: EdgeInsets.only(left: 22.h),
                        child: Text(
                            item.isFolder == 1 ? "lbl_folder".tr : item.mime,
                            style: theme.textTheme.titleMedium))
                  ])),
              SizedBox(height: 17.v),
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Row(children: [
                    Text("lbl_size".tr,
                        style:
                            CustomTextStyles.titleMediumOnPrimaryContainer_1),
                    Padding(
                        padding: EdgeInsets.only(left: 44.h),
                        child: Text(item.size!.tr,
                            style: theme.textTheme.titleMedium))
                  ])),
              SizedBox(height: 18.v),
              Padding(
                  padding: EdgeInsets.only(left: 1.h, right: 48.h),
                  child: Row(children: [
                    Text("lbl_date".tr,
                        style:
                            CustomTextStyles.titleMediumOnPrimaryContainer_1),
                    Padding(
                        padding: EdgeInsets.only(left: 39.h),
                        child: Text(item.createdAt!.tr,
                            style: theme.textTheme.titleMedium))
                  ])),
              SizedBox(height: 17.v),
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Row(children: [
                    Text("lbl_location".tr,
                        style:
                            CustomTextStyles.titleMediumOnPrimaryContainer_1),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text("lbl_cloud".tr,
                            style: theme.textTheme.titleMedium))
                  ])),
              SizedBox(height: 8.v)
            ]));
  }

  /// Navigates to the previous screen.
  onTapImgClose() {
    Get.back();
  }
}
