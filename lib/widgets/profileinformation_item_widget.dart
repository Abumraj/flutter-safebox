import '../controller/settings_controller.dart';
import '../models/profileinformation_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

// ignore: must_be_immutable
class ProfileinformationItemWidget extends StatelessWidget {
  ProfileinformationItemWidget(
    this.profileinformationItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProfileinformationItemModel profileinformationItemModelObj;

  var controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(profileinformationItemModelObj.screen!.value);
      },
      child: SizedBox(
          height: 80.v,
          width: 315.h,
          child: Container(
            child: ListTile(
              leading: Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CustomImageView(
                      imagePath:
                          profileinformationItemModelObj.userImage!.value,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 4.h),
                    ),
                  ),
                ),
              ),
              title: Obx(
                () => Text(
                  profileinformationItemModelObj.profileInformation!.value,
                  style: CustomTextStyles.titleMediumSFProText,
                ),
              ),
              subtitle: Obx(
                () => Text(
                  profileinformationItemModelObj
                      .changeAccountInformation!.value,
                  style: CustomTextStyles.bodyMedium_1,
                ),
              ),
              trailing: Obx(
                () => CustomImageView(
                  imagePath: profileinformationItemModelObj
                      .accountInformationArrow!.value,
                  height: 30.v,
                  width: 34.h,
                  // margin: EdgeInsets.only(
                  //   // left: 42.h,
                  //   top: 5.v,
                  //   bottom: 5.v,
                  // ),
                ),
              ),
            ),
          )

          // Stack(
          //   alignment: Alignment.centerRight,
          //   children: [
          //     Obx(
          //       () => CustomImageView(
          //         imagePath: profileinformationItemModelObj.userImage!.value,
          //         height: 20.adaptSize,
          //         width: 20.adaptSize,
          //         alignment: Alignment.centerLeft,
          //         margin: EdgeInsets.only(left: 4.h),
          //       ),
          //     ),
          //     Align(
          //       alignment: Alignment.centerLeft,
          //       child: Container(
          //         padding: EdgeInsets.symmetric(vertical: 15.v),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Obx(
          //                   () => Text(
          //                     profileinformationItemModelObj
          //                         .profileInformation!.value,
          //                     style: CustomTextStyles.titleMediumSFProText,
          //                   ),
          //                 ),
          //                 SizedBox(height: 7.v),
          //                 Obx(
          //                   () => Text(
          //                     profileinformationItemModelObj
          //                         .changeAccountInformation!.value,
          //                     style: CustomTextStyles.bodyMedium_1,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Obx(
          //               () => CustomImageView(
          //                 imagePath: profileinformationItemModelObj
          //                     .accountInformationArrow!.value,
          //                 height: 30.v,
          //                 width: 34.h,
          //                 margin: EdgeInsets.only(
          //                   left: 42.h,
          //                   top: 5.v,
          //                   bottom: 5.v,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          ),
    );
  }
}
