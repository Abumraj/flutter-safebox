import 'package:safebox/presentation/files_page_screen.dart';

import '../controller/added_folder_one_controller.dart';
import '../models/filescolumn_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

// ignore: must_be_immutable
class FilescolumnItemWidget extends StatelessWidget {
  FilescolumnItemWidget(
    this.filescolumnItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FilescolumnItemModel filescolumnItemModelObj;

  var controller = Get.find<AddedFolderOneController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            Get.to(FilesPageScreen(
              title: filescolumnItemModelObj.filesText!.value,
            ));
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 9.h,
              vertical: 10.v,
            ),
            decoration: AppDecoration.gradientBlueDToBlue.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => CustomImageView(
                    imagePath: filescolumnItemModelObj.userImage!.value,
                    height: 22.adaptSize,
                    width: 22.adaptSize,
                  ),
                ),
                SizedBox(height: 14.v),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Obx(
                    () => Text(
                      filescolumnItemModelObj.filesText!.value,
                      style: CustomTextStyles.bodyMediumBlack90001,
                    ),
                  ),
                ),
                SizedBox(height: 2.5.v),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Obx(
                    () => Text(
                      filescolumnItemModelObj.itemsText!.value,
                      style: CustomTextStyles.bodySmall10,
                    ),
                  ),
                ),
                SizedBox(height: 2.v),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
