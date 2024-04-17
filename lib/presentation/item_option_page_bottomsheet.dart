import 'package:flutter/material.dart';
import 'package:safebox/controller/item_option_page_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/presentation/copy_to_my_design_screen.dart';
import 'package:safebox/presentation/information_bottomsheet.dart';
import 'package:safebox/presentation/rename_folder_dialog.dart';

// ignore_for_file: must_be_immutable
class ItemOptionPageBottomsheet extends StatelessWidget {
  ItemOptionPageController controller = Get.put(ItemOptionPageController());
  final UserfilesItemModel item;
  final Function reloadResource;
  ItemOptionPageBottomsheet(
      {Key? key, required this.item, required this.reloadResource})
      : super(key: key);

  // ItemOptionPageController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 29.h, vertical: 23.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCarbonFolderRow(item.name, item.size, item.createdAt),
              SizedBox(height: 29.v),
              InkWell(
                onTap: () {
                  Get.back();
                  Get.bottomSheet(InformationBottomsheet(
                    item: item,
                  ));
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgAkarIconsInfoFill,
                          height: 16.adaptSize,
                          width: 16.adaptSize),
                      Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text("lbl_information".tr,
                              style: theme.textTheme.bodyLarge))
                    ])),
              ),
              SizedBox(height: 29.v),
              InkWell(
                onTap: () {
                  Get.back();
                  var data = {'id': item.id};
                  controller.starFileOrFolder(data, reloadResource);
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgBookmark,
                          height: 16.adaptSize,
                          width: 16.adaptSize),
                      Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text(
                              item.isFavourite == true
                                  ? "Unstar"
                                  : "lbl_star".tr,
                              style: theme.textTheme.bodyLarge))
                    ])),
              ),
              SizedBox(height: 29.v),
              InkWell(
                onTap: () {
                  Get.back();
                  controller.renameController.text = item.name!;
                  Get.dialog(AlertDialog(
                    backgroundColor: Colors.transparent.withAlpha(3),
                    content: RenameFolderDialog(
                      folderId: item.id!,
                      folderName: item.name.toString(),
                      reloadResource: reloadResource,
                    ),
                  ));
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgIcRoundDrive,
                          height: 16.adaptSize,
                          width: 16.adaptSize),
                      InkWell(
                        onTap: () {
                          Get.back();
                          controller.renameController.text = item.name!;
                          Get.dialog(AlertDialog(
                            backgroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            content: RenameFolderDialog(
                              folderId: item.id!,
                              folderName: item.name.toString(),
                              reloadResource: reloadResource,
                            ),
                          ));
                        },
                        child: Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text("lbl_rename".tr,
                                style: theme.textTheme.bodyLarge)),
                      )
                    ])),
              ),
              if (item.isFolder != 1) SizedBox(height: 29.v),
              if (item.isFolder != 1)
                InkWell(
                  onTap: () {
                    Get.back();
                    controller.restore(item.id!, item.name!);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgIcRoundRestorePage,
                            height: 16.adaptSize,
                            width: 16.adaptSize),
                        Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text("msg_restore_to_device".tr,
                                style: theme.textTheme.bodyLarge))
                      ])),
                ),
              SizedBox(height: 29.v),
              InkWell(
                onTap: () {
                  Get.to(CopyToMyDesignScreen(
                    childId: item.id!,
                    title: "Move To",
                  ));
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgBiArrowsMove,
                          height: 16.adaptSize,
                          width: 16.adaptSize),
                      Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text("lbl_move_to".tr,
                              style: theme.textTheme.bodyLarge))
                    ])),
              ),
              SizedBox(height: 30.v),
              InkWell(
                onTap: () {
                  Get.to(CopyToMyDesignScreen(
                    childId: item.id!,
                    title: "Copy To",
                  ));
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgFluentCopy24Filled,
                          height: 16.adaptSize,
                          width: 16.adaptSize),
                      Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text("lbl_copy".tr,
                              style: theme.textTheme.bodyLarge))
                    ])),
              ),
              SizedBox(height: 20.v),
              Row(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgFluentDelete28Filled,
                    height: 17.adaptSize,
                    width: 17.adaptSize),
                InkWell(
                  onTap: () {
                    Get.back();
                    var data = {
                      'ids': [item.id]
                    };
                    controller.deleteFileOrFolder(data, reloadResource);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text("lbl_delete".tr,
                          style: theme.textTheme.bodyLarge)),
                )
              ]),
              SizedBox(height: 7.v)
            ]));
  }

  /// Section Widget
  Widget _buildCarbonFolderRow(title, size, createdAt) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  // width: 190.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    CustomImageView(
                        imagePath: item.isFolder == 1
                            ? ImageConstant.imgCarbonFolder
                            : ImageConstant.imgFileGreenA400,
                        height: 36.adaptSize,
                        width: 36.adaptSize),
                    Padding(
                        padding: EdgeInsets.only(top: 3.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  item.name!.characters.length < 24
                                      ? item.name.toString()
                                      : "${item.name.toString().substring(0, 24)}..",
                                  style: theme.textTheme.titleMedium),
                              SizedBox(height: 3.v),
                              SizedBox(
                                  // width: 100.h,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 1.v),
                                        child: Text(size,
                                            style: theme.textTheme.bodySmall)),
                                    Text(createdAt,
                                        style: theme.textTheme.bodySmall)
                                  ]))
                            ]))
                  ])),
              CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  height: 12.adaptSize,
                  width: 12.adaptSize,
                  margin: EdgeInsets.only(bottom: 24.v),
                  onTap: () {
                    onTapImgClose();
                  })
            ]));
  }

  /// Navigates to the previous screen.
  onTapImgClose() {
    Get.back();
  }
}
