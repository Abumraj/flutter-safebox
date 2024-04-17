import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
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
  final AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SizedBox(
        width: 90.h,
        child: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              if (filescolumnItemModelObj.isActive!.value) {
                Get.to(FilesPageScreen(
                  title: filescolumnItemModelObj.filesText!.value,
                ));
              } else {
                ProgressDialogUtils.showFailureToast(
                    "${filescolumnItemModelObj.filesText!.value} upload and back up coming soon");
              }
            },
            child: Container(
              width: 100.h,
              padding: EdgeInsets.only(
                left: 10.h,
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
                        fileCount().toString(),
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
      ),
    );
  }

  fileCount() {
    if (filescolumnItemModelObj.filesText!.value == "Files") {
      return filescolumnItemModelObj.itemsText!.value =
          "${accountController.accountModelObj.value.documentCount} items";
    } else if (filescolumnItemModelObj.filesText!.value == "Photos") {
      return filescolumnItemModelObj.itemsText!.value =
          "${accountController.accountModelObj.value.photoCount} items";
    } else if (filescolumnItemModelObj.filesText!.value == "Videos") {
      return filescolumnItemModelObj.itemsText!.value =
          "${accountController.accountModelObj.value.videoCount} items";
    } else if (filescolumnItemModelObj.filesText!.value == "Audios") {
      return filescolumnItemModelObj.itemsText!.value =
          "${accountController.accountModelObj.value.audioCount} items";
    } else if (filescolumnItemModelObj.filesText!.value == "Contacts") {
      return filescolumnItemModelObj.itemsText!.value = "0 items";
    } else if (filescolumnItemModelObj.filesText!.value == "Whatsapp") {
      return filescolumnItemModelObj.itemsText!.value =
          "${accountController.accountModelObj.value.whatsappCount} items";
    }
  }
}
