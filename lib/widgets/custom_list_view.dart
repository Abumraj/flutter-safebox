import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/presentation/item_option_page_bottomsheet.dart';
import 'package:safebox/presentation/move_to_my_design_screen.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';

class CustomListView extends StatelessWidget {
  final UserfilesItemModel item;
  final Function reloadResource;

  const CustomListView(
      {super.key, required this.item, required this.reloadResource});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (item.isFolder == 1) {
          Get.to(MoveToMyDesignScreen(
            path: item.path!,
            folderId: item.id!,
            name: item.name!,
          ));
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 30.h, right: 25.h, bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 33.v,
              width: 37.h,
              margin: EdgeInsets.only(bottom: 5.v),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: item.isFolder == 1
                        ? ImageConstant.imgCarbonFolderBlue200
                        : ImageConstant.imgFileGreenA400,
                    height: 33.v,
                    width: 37.h,
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
                          if (item.isFavourite!)
                            CustomImageView(
                              imagePath: ImageConstant.imgFile,
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
                    item.name!.characters.length < 24
                        ? item.name.toString()
                        : "${item.name.toString().substring(0, 24)}..",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 2.v),
                  _buildFilesize(
                    fileSize: "${item.size}",
                    timeAgo: "${item.createdAt}",
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.bottomSheet(ItemOptionPageBottomsheet(
                  item: item,
                  reloadResource: reloadResource,
                ));
              },
              child: CustomImageView(
                imagePath: ImageConstant.imgInfo,
                height: 36.v,
                width: 28.h,
                margin: EdgeInsets.only(bottom: 6.v),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapArrowLeft() {
    Get.back();
  }

  Widget _buildFilesize({
    required String fileSize,
    required String timeAgo,
  }) {
    return SizedBox(
      width: 120.h,
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
            timeAgo,
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(title) {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 12.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title:
            AppbarSubtitleOne(text: title, margin: EdgeInsets.only(left: 10.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgIcRoundCreateNewFolder,
              margin: EdgeInsets.fromLTRB(28.h, 13.v, 28.h, 12.v))
        ]);
  }
}
