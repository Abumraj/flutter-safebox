import '../controller/added_folder_one_controller.dart';
import '../models/mydesigns_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

// ignore: must_be_immutable
class MydesignsItemWidget extends StatelessWidget {
  MydesignsItemWidget(
    this.mydesignsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MydesignsItemModel mydesignsItemModelObj;

  var controller = Get.find<AddedFolderOneController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => CustomImageView(
            imagePath: mydesignsItemModelObj.userImage!.value,
            height: 36.adaptSize,
            width: 36.adaptSize,
            margin: EdgeInsets.only(bottom: 2.v),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10.h,
            top: 6.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  mydesignsItemModelObj.myDesigns!.value,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 2.v),
              SizedBox(
                width: 93.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Obx(
                        () => Text(
                          mydesignsItemModelObj.fileSize!.value,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        mydesignsItemModelObj.timeAgo!.value,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
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
