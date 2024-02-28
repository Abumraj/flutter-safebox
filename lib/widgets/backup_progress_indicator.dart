import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';

class BackupProgressindicator extends StatelessWidget {
  BackupProgressindicator({required this.controller, super.key});
  Uploadanager controller;
  @override
  Widget build(BuildContext context) {
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
                    controller.progressUpdate.value.toInt() < 100
                        ? "msg_backup_in_progress".tr
                        : "msg_backup_completed".tr,
                    style: CustomTextStyles.titleSmallOnPrimary,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (controller.progressUpdate.value.toInt() == 100) {
                      controller.resetProgress();
                    }
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCloseOnprimary,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
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
                Obx(() => Text(
                      "${ProgressDialogUtils.formatFileSize(controller.totalUploadSize * (controller.progressUpdate.value ~/ 100))}/${ProgressDialogUtils.formatFileSize(controller.totalUploadSize)}",
                      style: CustomTextStyles.labelMediumOnPrimaryContainer,
                    )),
                Obx(
                  () => Text(
                    "${controller.progressUpdate.value.toInt().toString()}%",
                    style: CustomTextStyles.labelMediumOnPrimaryContainer,
                  ),
                )
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
                child: Obx(
                  () => LinearProgressIndicator(
                    value: controller.progressUpdate.value,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      appTheme.amberA200,
                    ),
                  ),
                )),
          ),
          SizedBox(height: 1.v),
        ],
      ),
    );
  }
}
