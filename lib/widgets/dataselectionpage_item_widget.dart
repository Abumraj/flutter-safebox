import '../controller/data_selection_page_controller.dart';
import '../models/dataselectionpage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

// ignore: must_be_immutable
class DataselectionpageItemWidget extends StatelessWidget {
  DataselectionpageItemWidget(
    this.dataselectionpageItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DataselectionpageItemModel dataselectionpageItemModelObj;

  var controller = Get.find<DataSelectionPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3.v),
            child: Obx(
              () => Text(
                dataselectionpageItemModelObj.contacts!.value,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          Obx(
            () => CustomImageView(
              imagePath: dataselectionpageItemModelObj.checkmarkImage!.value,
              height: 12.adaptSize,
              width: 12.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 3.v),
            ),
          ),
        ],
      ),
    );
  }
}
