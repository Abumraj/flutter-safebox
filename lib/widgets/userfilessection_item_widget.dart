import '../controller/storage_page_one_controller.dart';
import '../models/userfilessection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class UserfilessectionItemWidget extends StatelessWidget {
  UserfilessectionItemWidget(
    this.userfilessectionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserfilessectionItemModel userfilessectionItemModelObj;

  var controller = Get.find<StoragePageOneController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => CustomIconButton(
            height: 45.adaptSize,
            width: 45.adaptSize,
            padding: EdgeInsets.all(9.h),
            child: CustomImageView(
              imagePath: userfilessectionItemModelObj.menuIcon!.value,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Obx(
                    () => Text(
                      userfilessectionItemModelObj.filesText!.value,
                      style: CustomTextStyles.titleMedium_1,
                    ),
                  ),
                ),
                SizedBox(height: 4.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        userfilessectionItemModelObj.storageSize!.value,
                        style: CustomTextStyles
                            .labelLargeSofiaProOnPrimaryContainerMedium,
                      ),
                    ),
                    Obx(
                      () => Text(
                        userfilessectionItemModelObj.itemsCount!.value,
                        style: CustomTextStyles
                            .labelLargeSofiaProOnPrimaryContainerMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.v),
                Container(
                  height: 8.v,
                  width: 258.h,
                  decoration: BoxDecoration(
                    color: appTheme.gray100,
                    borderRadius: BorderRadius.circular(
                      4.h,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      4.h,
                    ),
                    child: LinearProgressIndicator(
                      value: 0.17,
                      backgroundColor: appTheme.gray100,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        appTheme.blue800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
