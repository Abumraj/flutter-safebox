import 'package:flutter/material.dart';
import 'package:safebox/controller/starred_folder_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class NameFolderPageDialog extends StatelessWidget {
  NameFolderPageDialog(
    this.controller, {
    Key? key,
    this.folderId,
    this.functionCallBack,
  }) : super(
          key: key,
        );
  final int? folderId;
  final Function? functionCallBack;
  StarredFolderController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 315.h,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_new_folder".tr,
            style: CustomTextStyles.labelLargeOnPrimaryContainer,
          ),
          SizedBox(height: 14.v),
          CustomTextFormField(
            controller: controller.folderNameController,
            hintText: "New Folder".tr,
            hintStyle: CustomTextStyles.titleSmallOnPrimary,
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 10.v,
            ),
          ),
          SizedBox(height: 20.v),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 8.v,
                      bottom: 9.v,
                    ),
                    child: Text(
                      "lbl_cancel".tr,
                      style: CustomTextStyles.labelLargeSofiaProBlue800,
                    ),
                  ),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    if (folderId != null) {
                      controller.createSubFolderInCloud(folderId).then((_) {
                        functionCallBack!();
                      });
                    } else {
                      controller.createFolderInCloud();
                    }
                  },
                  height: 30.v,
                  width: 74.h,
                  text: "lbl_create".tr,
                  margin: EdgeInsets.only(left: 15.h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
