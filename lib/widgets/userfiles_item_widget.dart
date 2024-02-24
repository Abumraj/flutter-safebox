import '../controller/files_page_controller.dart';
import '../models/userfiles_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

// ignore: must_be_immutable
class UserfilesItemWidget extends StatelessWidget {
  UserfilesItemWidget(
    this.userfilesItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserfilesItemModel userfilesItemModelObj;

  var controller = Get.find<FilesPageController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 6.v),
          padding: EdgeInsets.symmetric(
            horizontal: 5.h,
            vertical: 4.v,
          ),
          decoration: AppDecoration.fillRed100.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Text(
                  userfilesItemModelObj.name!,
                  style: CustomTextStyles.labelSmallSecondaryContainer,
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
            top: 3.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  userfilesItemModelObj.name!,
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
                        userfilesItemModelObj.size!,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.h),
                    child: Obx(
                      () => Text(
                        userfilesItemModelObj.createdAt!,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgInfo,
          height: 26.v,
          width: 22.h,
          margin: EdgeInsets.only(bottom: 8.v),
        ),
      ],
    );
  }
}
