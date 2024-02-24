import 'package:flutter/material.dart';
import 'package:safebox/controller/item_option_page_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_text_form_field.dart';

class RenameFolderDialog extends StatelessWidget {
  final ItemOptionPageController controller =
      Get.put(ItemOptionPageController());
  final int folderId;
  final String folderName;
  final Function reloadResource;

  RenameFolderDialog({
    Key? key,
    required this.folderId,
    required this.folderName,
    required this.reloadResource,
  }) : super(
          key: key,
        );

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
            "lbl_rename_folder".tr,
            style: CustomTextStyles.labelLargeOnPrimaryContainer,
          ),
          SizedBox(height: 14.v),
          CustomTextFormField(
            controller: controller.renameController,
            hintText: "lbl_my_designs".tr,
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
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.v,
                    bottom: 9.v,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "lbl_cancel".tr,
                      style: CustomTextStyles.labelLargeSofiaProBlue800,
                    ),
                  ),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    Get.back();
                    var data = {'folderId': folderId, 'name': folderName};
                    controller.renameFileOrFolder(data, reloadResource);
                  },
                  height: 30.v,
                  width: 74.h,
                  text: "lbl_rename".tr,
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
