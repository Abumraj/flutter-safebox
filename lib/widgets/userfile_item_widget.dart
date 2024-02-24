import '../controller/added_folder_one_controller.dart';
import '../models/userfile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

// ignore: must_be_immutable
class UserfileItemWidget extends StatelessWidget {
  UserfileItemWidget(
    this.userfileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserfileItemModel userfileItemModelObj;

  var controller = Get.find<AddedFolderOneController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 6.v,
            bottom: 4.v,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 5.h,
            vertical: 4.v,
          ),
          decoration: AppDecoration.fillRed.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Text(
                  userfileItemModelObj.fileName!.value,
                  style: theme.textTheme.labelSmall,
                ),
              ),
              Container(
                height: 2.v,
                width: 21.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(
                    1.h,
                  ),
                ),
              ),
              SizedBox(height: 2.v),
              Container(
                height: 2.v,
                width: 21.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(
                    1.h,
                  ),
                ),
              ),
              SizedBox(height: 2.v),
              Container(
                height: 2.v,
                width: 21.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(
                    1.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            top: 5.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  userfileItemModelObj.weburl!.value,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 2.v),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.v),
                    child: Obx(
                      () => Text(
                        userfileItemModelObj.fileSize!.value,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Obx(
                      () => Text(
                        userfileItemModelObj.fileTime!.value,
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
          margin: EdgeInsets.only(bottom: 6.v),
        ),
      ],
    );
  }
}
