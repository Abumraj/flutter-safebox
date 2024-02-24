import 'package:flutter/material.dart';
import 'package:safebox/controller/starred_folder_controller.dart';
import 'package:safebox/core/app_export.dart';
// import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/presentation/sort_page_bottomsheet.dart';

// ignore: must_be_immutable
class CustomRecentFile extends GetWidget<StarredFolderController> {
  final String title;
  final bool gridView;
  final Function sortAscending;
  final Function sortDescending;
  final Function isGridList;
  final Function sortBySizeBiggest;
  final Function sortBySizeSmallest;
  final Function sortByDate;
  const CustomRecentFile(
      this.title,
      this.sortAscending,
      this.sortDescending,
      this.isGridList,
      this.gridView,
      this.sortBySizeBiggest,
      this.sortBySizeSmallest,
      this.sortByDate,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Get.bottomSheet(SortPageBottomsheet(
                sortAscending: sortAscending,
                sortdescending: sortDescending,
                sortBySizeBiggest: sortBySizeBiggest,
                sortBySizeSmallest: sortBySizeSmallest,
                sortByDate: sortByDate,
              ));
            },
            child: Text(
              title.tr,
              style: theme.textTheme.titleMedium,
            ),
          ),
          InkWell(
            onTap: () {
              Get.bottomSheet(SortPageBottomsheet(
                sortAscending: sortAscending,
                sortdescending: sortDescending,
                sortBySizeBiggest: sortBySizeBiggest,
                sortBySizeSmallest: sortBySizeSmallest,
                sortByDate: sortByDate,
              ));
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgGroup109,
              height: 12.v,
              width: 14.h,
              margin: EdgeInsets.only(
                left: 6.h,
                top: 4.v,
                bottom: 3.v,
              ),
            ),
          ),
          const Spacer(),
          // Obx(
          //   () =>
          InkWell(
              onTap: () {
                // controller.isGridView.value = !controller.isGridView.value;
                // if (isGridList != null) {}
                isGridList();
              },
              child: gridView == true
                  ? CustomImageView(
                      imagePath: ImageConstant.imgPlus,
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      margin: EdgeInsets.only(top: 1.v),
                    )
                  : CustomImageView(
                      imagePath: ImageConstant.imgPlus,
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      margin: EdgeInsets.only(top: 1.v),
                    )),
          // )
        ],
      ),
    );
  }
}
