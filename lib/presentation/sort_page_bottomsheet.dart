import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

// ignore: must_be_immutable
class SortPageBottomsheet extends StatelessWidget {
  const SortPageBottomsheet(
      {Key? key,
      required this.sortAscending,
      required this.sortdescending,
      required this.sortBySizeBiggest,
      required this.sortBySizeSmallest,
      required this.sortByDate})
      : super(
          key: key,
        );
  // StarredFolderController controller;
  final Function sortAscending;
  final Function sortdescending;
  final Function sortBySizeBiggest;
  final Function sortBySizeSmallest;
  final Function sortByDate;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 7.v,
                    bottom: 2.v,
                  ),
                  child: Text(
                    "lbl_sort_by2".tr,
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
          SizedBox(height: 26.v),
          InkWell(
            onTap: () {
              sortAscending();
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFluentTextSor,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "msg_name_ascending".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28.v),
          InkWell(
            onTap: () {
              sortdescending();
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFluentTextSorOnprimarycontainer,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "msg_name_descending".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28.v),
          InkWell(
            onTap: () {
              sortBySizeBiggest();
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgPhSortAscendingDuotone,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_size_largest".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28.v),
          InkWell(
            onTap: () {
              sortBySizeSmallest();
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMdiSortAscending,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_size_smallest".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28.v),
          InkWell(
            onTap: () {
              sortByDate();
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMdiSortCalendarAscending,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "msg_date_descending".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 13.v),
        ],
      ),
    );
  }
}
