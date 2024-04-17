import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/transaction_model.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class TransactionTile extends StatelessWidget {
  TransactionTile(
    this.userprofile1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TransactionModel userprofile1ItemModelObj;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgRectangle290,
          height: 36.adaptSize,
          width: 36.adaptSize,
          radius: BorderRadius.circular(
            18.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userprofile1ItemModelObj.type.toString(),
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: 4.v),
              Text(
                "₦${userprofile1ItemModelObj.amount}",
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: 3.v,
            bottom: 2.v,
          ),
          child: Column(
            children: [
              Text(
                ProgressDialogUtils.formatDateTime(
                    userprofile1ItemModelObj.updatedAt!),
                style: CustomTextStyles.bodySmall10,
              ),
              SizedBox(height: 2.v),
              CustomElevatedButton(
                height: 19.v,
                width: 47.h,
                text: userprofile1ItemModelObj.status.toString(),
                buttonTextStyle: CustomTextStyles.labelMediumOnPrimary,
                buttonStyle:
                    userprofile1ItemModelObj.status.toString() == "pending"
                        ? CustomButtonStyles.fillAmberA
                        : CustomButtonStyles.fillGreen,
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
