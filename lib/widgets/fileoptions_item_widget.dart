
import '../models/fileoptions_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

// ignore: must_be_immutable
class FileoptionsItemWidget extends StatelessWidget {
  FileoptionsItemWidget(
    this.fileoptionsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FileoptionsItemModel fileoptionsItemModelObj;

  // var controller = Get.find<GettingStartedModel>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // fileoptionsItemModelObj.checkmarkImage =
          //     !fileoptionsItemModelObj.checkmarkImage;
          // // controller.update();
          // print(fileoptionsItemModelObj.checkmarkImage);
        },
        child: 
           Container(
            padding: EdgeInsets.symmetric(
              horizontal: 19.h,
              vertical: 14.v,
            ),
            decoration: fileoptionsItemModelObj.checkmarkImage == true
                ? AppDecoration.outlineBlue.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  )
                : AppDecoration.outlineGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.v),
                  child: Text(
                    fileoptionsItemModelObj.productName,
                    style: theme.textTheme.titleMedium,
                  ),
                ),

                //  ImageConstant.imgTwitter
                // ImageConstant.imgCheckmarkBlue800

                
                 CustomImageView(
                    imagePath:
                        fileoptionsItemModelObj.checkmarkImage == true
                            ? ImageConstant.imgCheckmarkBlue800
                            : ImageConstant.imgTwitter,
                    height: 12.adaptSize,
                    width: 12.adaptSize,
                    margin: EdgeInsets.only(
                      top: 3.v,
                      bottom: 2.v,
                    ),
                  ),
                
              ],
            ),
          ),
        );
  }
}
