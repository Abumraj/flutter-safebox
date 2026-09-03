import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safebox/core/utils/image_constant.dart';
import 'package:safebox/core/utils/size_utils.dart';
import 'package:safebox/theme/app_decoration.dart';
import 'package:safebox/theme/theme_helper.dart';
import 'package:safebox/widgets/custom_image_view.dart';

class ItemOptionBottomsheet extends StatelessWidget {
  final Function delete;
  final Function restore;
  ItemOptionBottomsheet({Key? key, required this.delete, required this.restore})
      : super(key: key);

  // ItemOptionPageController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 29.h, vertical: 23.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL30),
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 29.v),
                InkWell(
                  onTap: () {
                    Get.back();
                    restore();
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgIcRoundRestorePage,
                            height: 16.adaptSize,
                            width: 16.adaptSize),
                        Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text("msg_restore_to_device".tr,
                                style: theme.textTheme.bodyLarge))
                      ])),
                ),
                SizedBox(height: 15.v),
                Row(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgFluentDelete28Filled,
                      height: 17.adaptSize,
                      width: 17.adaptSize),
                  InkWell(
                    onTap: () {
                      Get.back();
                      delete();
                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text("lbl_delete".tr,
                            style: theme.textTheme.bodyLarge)),
                  )
                ]),
                SizedBox(height: 10.v)
              ]),
        ));
  }

  /// Navigates to the previous screen.
  onTapImgClose() {
    Get.back();
  }
}
