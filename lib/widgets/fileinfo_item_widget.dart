import '../controller/added_folder_one_controller.dart';
import '../models/fileinfo_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

// ignore: must_be_immutable
class FileinfoItemWidget extends StatelessWidget {
  FileinfoItemWidget(
    this.fileinfoItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FileinfoItemModel fileinfoItemModelObj;

  var controller = Get.find<AddedFolderOneController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => CustomImageView(
            imagePath: fileinfoItemModelObj.fileImage!.value,
            height: 30.adaptSize,
            width: 30.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 3.v),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 13.h,
            top: 5.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  fileinfoItemModelObj.fileName!.value,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 2.v),
              Row(
                children: [
                  Obx(
                    () => Text(
                      fileinfoItemModelObj.fileSize!.value,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Obx(
                      () => Text(
                        fileinfoItemModelObj.fileTime!.value,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgInfo,
          height: 31.v,
          width: 22.h,
          margin: EdgeInsets.only(bottom: 4.v),
        ),
      ],
    );
  }
}
