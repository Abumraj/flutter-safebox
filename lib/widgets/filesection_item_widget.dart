import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';

import '../controller/storage_page_controller.dart';
import '../models/filesection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class FilesectionItemWidget extends StatelessWidget {
  FilesectionItemWidget(
    this.filesectionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FilesectionItemModel filesectionItemModelObj;
  final AccountController accountController = Get.put(AccountController());

  var controller = Get.find<StoragePageController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => CustomIconButton(
            height: 45.adaptSize,
            width: 45.adaptSize,
            padding: EdgeInsets.all(9.h),
            child: CustomImageView(
              imagePath: filesectionItemModelObj.menuIcon!.value,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Obx(
                    () => Text(
                      filesectionItemModelObj.fileName!.value,
                      style: CustomTextStyles.titleMedium_1,
                    ),
                  ),
                ),
                SizedBox(height: 4.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        filesectionItemModelObj.fileSize!.value,
                        style: CustomTextStyles
                            .labelLargeSofiaProOnPrimaryContainerMedium,
                      ),
                    ),
                    Obx(
                      () => Text(
                        filesectionItemModelObj.fileCount!.value,
                        style: CustomTextStyles
                            .labelLargeSofiaProOnPrimaryContainerMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.v),
                Container(
                  height: 8.v,
                  width: 258.h,
                  decoration: BoxDecoration(
                    color: appTheme.gray100,
                    borderRadius: BorderRadius.circular(
                      4.h,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      4.h,
                    ),
                    child: LinearProgressIndicator(
                      value: progress(),
                      backgroundColor: appTheme.gray100,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        appTheme.blue800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  double progress() {
    double progress = 0.0;
    if (filesectionItemModelObj.fileName!.value == "Files") {
      progress = ProgressDialogUtils.getSizeComparableValue(
              accountController.accountModelObj.value.sizeDocument) /
          ProgressDialogUtils.getSizeComparableValue(
              accountController.accountModelObj.value.totalStorage);
    } else if (filesectionItemModelObj.fileName!.value == "Photos") {
      progress = ProgressDialogUtils.getSizeComparableValue(
              accountController.accountModelObj.value.sizePhoto) /
          ProgressDialogUtils.getSizeComparableValue(
              accountController.accountModelObj.value.totalStorage);
    } else if (filesectionItemModelObj.fileName!.value == "Videos") {
      progress = ProgressDialogUtils.getSizeComparableValue(
              accountController.accountModelObj.value.sizeVideo) /
          ProgressDialogUtils.getSizeComparableValue(
              accountController.accountModelObj.value.totalStorage);
    } else if (filesectionItemModelObj.fileName!.value == "Audios") {
      progress = ProgressDialogUtils.getSizeComparableValue(
              accountController.accountModelObj.value.sizeAudio) /
          ProgressDialogUtils.getSizeComparableValue(
              accountController.accountModelObj.value.totalStorage);
    } else if (filesectionItemModelObj.fileName!.value == "Contacts") {
      // Get.to(const CustomContactSelectionScreen());
    } else if (filesectionItemModelObj.fileName!.value == "Whatsapp") {
      progress = ProgressDialogUtils.getSizeComparableValue(
              accountController.accountModelObj.value.sizeWhatsapp) /
          ProgressDialogUtils.getSizeComparableValue(
              accountController.accountModelObj.value.totalStorage);
    }
    return progress;
  }
}
