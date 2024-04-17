import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/presentation/copy_page_screen.dart';
import 'package:safebox/presentation/item_option_page_bottomsheet.dart';
import 'package:safebox/presentation/move_to_my_design_screen.dart';

class CustomGridView extends StatelessWidget {
  final UserfilesItemModel item;
  final Function reloadResource;
  final bool? isCopy;
  final int? childId;

  const CustomGridView(
      {super.key,
      required this.item,
      required this.reloadResource,
      this.isCopy,
      this.childId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (item.isFolder == 1) {
          if (isCopy == null) {
            Get.to(MoveToMyDesignScreen(
              path: item.path!,
              folderId: item.id!,
              name: item.name!,
            ));
          } else {
            Get.to(CopyOrMoveScreen(
              fileId: childId!,
              path: item.path!,
              folderId: item.id!,
              name: isCopy! ? "Copy to ${item.name!}" : "Move to ${item.name!}",
              isCopy: isCopy!,
            ));
          }
        }
      },
      child: SizedBox(
        height: 100.v,
        width: 50.h,
        child: Padding(
          padding: EdgeInsets.only(
            left: 26.h,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: item.isFolder == 1
                        ? ImageConstant.imgCarbonFolderBlue200
                        : ImageConstant.imgFileGreenA400,
                    height: 139.v,
                    width: 138.h,
                    alignment: Alignment.topLeft,
                  ),
                  if (item.isFavourite!)
                    Positioned(
                      bottom: 17.adaptSize,
                      right: 55.adaptSize,
                      child: SizedBox(
                        height: 24.v,
                        width: 29.h,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgFile,
                          height: 10.adaptSize,
                          width: 10.adaptSize,
                          alignment: Alignment.bottomRight,
                          // margin: EdgeInsets.only(
                          //   right: 1.h,
                          //   bottom: 1.v,
                          // ),
                        ),
                      ),
                    ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 22.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width:
                            item.name!.characters.length < 10 ? 100.h : 130.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.name!.characters.length < 14
                                  ? item.name.toString()
                                  : "${item.name.toString().substring(0, 10)}..",
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                            // const Spacer(),
                            InkWell(
                              onTap: () {
                                Get.bottomSheet(ItemOptionPageBottomsheet(
                                  reloadResource: reloadResource,
                                  item: item,
                                ));
                              },
                              child: CustomImageView(
                                imagePath: ImageConstant.imgInfo,
                                height: 26.v,
                                width: 22.h,
                                alignment: Alignment.bottomRight,
                                // margin: EdgeInsets.only(bottom: 10.v),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.v),
                      SizedBox(
                        width: 120.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: Text(
                                item.size!.tr,
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: theme.colorScheme.onPrimaryContainer
                                      .withOpacity(1),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            Expanded(
                              child: Text(
                                item.createdAt!.tr,
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: theme.colorScheme.onPrimaryContainer
                                      .withOpacity(1),
                                ),
                              ),
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
      ),
    );
  }
}
