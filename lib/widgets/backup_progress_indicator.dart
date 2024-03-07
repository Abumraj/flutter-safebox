import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';

// ignore: must_be_immutable
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
      child: controller.totalbatchSize > 1 ||
              controller.isPreparingBackUp.value == true
          ? Column(
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
                          controller.totalUploadLength.toInt() <
                                  controller.totalUploadCount
                              ? "msg_backup_in_progress".tr
                              : controller.isPreparingBackUp.value == true
                                  ? "Preparing Backup"
                                  : "msg_backup_completed".tr,
                          style: CustomTextStyles.titleSmallOnPrimary,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.totalUploadLength.toInt() ==
                              controller.totalUploadCount) {
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
                      controller.isPreparingBackUp.value == true
                          ? const Text("")
                          : Obx(() => Text(
                                "${ProgressDialogUtils.formatFileSize(((controller.totalUploadLength.value.toInt() / controller.totalUploadCount.toInt()) * controller.totalUploadSize).toInt())}/${ProgressDialogUtils.formatFileSize(controller.totalUploadSize)}",
                                style: CustomTextStyles
                                    .labelMediumOnPrimaryContainer,
                              )),
                      controller.isPreparingBackUp.value == true
                          ? const Text("")
                          : Obx(() => Text(
                                "Backed up ${controller.totalUploadLength.value.toInt()} of ${controller.totalUploadCount} Files",
                                style: CustomTextStyles
                                    .labelMediumOnPrimaryContainer,
                              )),
                      controller.isPreparingBackUp.value == true
                          ? const Text("")
                          : Obx(
                              () => Text(
                                "${((controller.totalUploadLength.value.toInt() / controller.totalUploadCount.toInt()) * 100).toInt()}%",
                                style: CustomTextStyles
                                    .labelMediumOnPrimaryContainer,
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
                      child: controller.isPreparingBackUp.value == true
                          ? LinearProgressIndicator(
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                appTheme.amberA200,
                              ),
                            )
                          : Obx(
                              () => LinearProgressIndicator(
                                value:
                                    controller.totalUploadLength.value.toInt() /
                                        controller.totalUploadCount.toInt(),
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  appTheme.amberA200,
                                ),
                              ),
                            )),
                ),
                SizedBox(height: 1.v),
              ],
            )
          : Column(
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
                            "${ProgressDialogUtils.formatFileSize(((controller.progressUpdate.value.toInt() / 100) * controller.totalUploadSize).toInt())}/${ProgressDialogUtils.formatFileSize(controller.totalUploadSize)}",
                            style:
                                CustomTextStyles.labelMediumOnPrimaryContainer,
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
