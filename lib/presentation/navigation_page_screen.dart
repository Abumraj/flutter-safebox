import 'package:safebox/controller/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/presentation/data_selection_page_screen.dart';
import 'package:safebox/presentation/referral_overview.dart';
import 'package:safebox/presentation/settings_screen.dart';
import 'package:safebox/presentation/storage_page_screen.dart';
import 'package:safebox/presentation/upgrade_storage_screen.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';

class NavigationPageScreen extends GetWidget<AccountController> {
  NavigationPageScreen({Key? key}) : super(key: key);
  final AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
          height: 700.v,
          width: double.maxFinite,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.only(top: 16.v),
                    padding: EdgeInsets.only(
                        left: 15.h, top: 37.v, bottom: 37.v, right: 5),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildPolygonThreeRow()),
                          SizedBox(height: 39.v),
                          InkWell(
                            onTap: () {
                              // Get.to(RestoreToDeviceScreen());
                            },
                            child: Row(children: [
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgIcRoundRestorePage,
                                  height: 16.adaptSize,
                                  width: 16.adaptSize),
                              Padding(
                                  padding: EdgeInsets.only(left: 10.h),
                                  child: Text("lbl_restore_files".tr,
                                      style: theme.textTheme.bodyLarge))
                            ]),
                          ),
                          SizedBox(height: 30.v),
                          InkWell(
                            onTap: () {
                              Get.to(StoragePageScreen());
                            },
                            child: _buildCiSettingsFilled(
                                userImage: ImageConstant.imgClarityStorageSolid,
                                settingsLabel: "lbl_storage".tr),
                          ),
                          SizedBox(height: 28.v),
                          InkWell(
                            onTap: () {
                              Get.to(const DataSelectionPageScreen());
                            },
                            child: Row(children: [
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgPhSelectionAllFill,
                                  height: 16.adaptSize,
                                  width: 16.adaptSize),
                              Padding(
                                  padding: EdgeInsets.only(left: 10.h),
                                  child: Text("lbl_data_selection".tr,
                                      style: theme.textTheme.bodyLarge))
                            ]),
                          ),
                          SizedBox(height: 30.v),
                          InkWell(
                            onTap: () {
                              Get.to(SettingsScreen());
                            },
                            child: _buildCiSettingsFilled(
                                userImage: ImageConstant.imgCiSettingsFilled,
                                settingsLabel: "lbl_settings".tr),
                          ),
                          SizedBox(height: 30.v),
                          InkWell(
                            onTap: () {
                              Get.to(const ReferralOverview());
                            },
                            child: _buildCiSettingsFilled(
                                userImage: ImageConstant.imgCiSettingsFilled,
                                settingsLabel: "Referrals".tr),
                          ),
                          SizedBox(height: 28.v),
                          Text("msg_need_more_space".tr,
                              style: CustomTextStyles
                                  .labelLargeSofiaProBlue800Medium),
                          SizedBox(height: 9.v),
                          CustomElevatedButton(
                              height: 40.v,
                              width: 129.h,
                              text: "lbl_upgrade".tr,
                              buttonStyle: CustomButtonStyles.outlinePrimary,
                              onPressed: () {
                                Get.to(const UpgradeStorageScreen());
                              },
                              buttonTextStyle: CustomTextStyles
                                  .titleMediumOpenSansWhiteA700),
                          const Spacer(),
                          // SizedBox(height: 41.v),
                          InkWell(
                            onTap: () {
                              accountController.logout();
                            },
                            child: Row(children: [
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgClarityLogoutSolid,
                                  height: 18.adaptSize,
                                  width: 18.adaptSize),
                              Padding(
                                  padding: EdgeInsets.only(left: 8.h, top: 2.v),
                                  child: Text("lbl_logout".tr,
                                      style: theme.textTheme.bodyLarge))
                            ]),
                          )
                        ]))),
            CustomImageView(
                imagePath: ImageConstant.imgCloseBlack90001,
                height: 28.adaptSize,
                width: 28.adaptSize,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 23.h, top: 9.v),
                onTap: () {
                  onTapImgClose();
                })
          ])),
    ));
  }

  /// Section Widget
  Widget _buildPolygonThreeRow() {
    return Container(
        padding: EdgeInsets.only(top: 19.v, bottom: 18.v, left: 12.v),
        decoration: AppDecoration.fillBlue
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: SizedBox(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CustomImageView(
                  imagePath: accountController.accountModelObj.value.picture ??
                      ImageConstant.imageNotFound,
                  height: 69.v,
                  width: 60.h,
                  radius: BorderRadius.circular(6.h)),
            ),

            SizedBox(
              height: 70.v,
              width: 215.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            child: Text(
                                controller.accountModelObj.value.name!
                                            .characters.length <
                                        14
                                    ? controller.accountModelObj.value.name
                                        .toString()
                                    : controller.accountModelObj.value.name
                                        .toString()
                                        .substring(0, 14),
                                style: CustomTextStyles.titleMediumWhiteA700_1),
                          ),
                          SizedBox(
                            width: 50.v,
                          ),
                          CustomImageView(
                              imagePath: ImageConstant.imgPolygon3,
                              height: 13.v,
                              width: 15.h,
                              alignment: Alignment.center),
                          Text("lbl_g".tr,
                              style: CustomTextStyles.sofiaProBlue800),
                          Text(controller.accountModelObj.value.planName!.tr,
                              style: CustomTextStyles.bodySmallWhiteA700)
                        ],
                      ),
                      Text(controller.accountModelObj.value.country.toString(),
                          style: CustomTextStyles.labelMediumBlue10001),
                      SizedBox(
                        height: 5.v,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "${controller.accountModelObj.value.usedStorage.toString()} used",
                              style:
                                  CustomTextStyles.labelLargeSofiaProWhiteA700),
                          SizedBox(
                            width: 110.v,
                          ),
                          Text(
                              "out of ${controller.accountModelObj.value.totalStorage.toString()}",
                              style: CustomTextStyles.labelMediumBlue10001),
                        ],
                      ),
                      SizedBox(height: 3.v),
                      Container(
                          height: 5.v,
                          width: 215.h,
                          decoration: BoxDecoration(
                              color: appTheme.blue10001,
                              borderRadius: BorderRadius.circular(2.h)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(2.h),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: LinearProgressIndicator(
                                    value: ProgressDialogUtils
                                            .getSizeComparableValue(
                                                accountController
                                                    .accountModelObj
                                                    .value
                                                    .usedStorage) /
                                        ProgressDialogUtils
                                            .getSizeComparableValue(
                                                accountController
                                                    .accountModelObj
                                                    .value
                                                    .totalStorage),
                                    backgroundColor: appTheme.blue10001,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        appTheme.amberA200)),
                              )))
                    ],
                  )
                ],
              ),
            )
            // SizedBox(
            //     height: 57.v,
            //     width: 215.h,
            //     child: Stack(alignment: Alignment.center, children: [
            //       Align(
            //           alignment: Alignment.topRight,
            //           child: Row(
            //               mainAxisAlignment: MainAxisAlignment.end,
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 Stack(alignment: Alignment.bottomCenter, children: [
            //                   CustomImageView(
            //                       imagePath: ImageConstant.imgPolygon3,
            //                       height: 13.v,
            //                       width: 15.h,
            //                       alignment: Alignment.center),
            //                   Align(
            //                       alignment: Alignment.bottomCenter,
            //                       child: Padding(
            //                           padding: EdgeInsets.only(bottom: 1.v),
            //                           child: Text("lbl_g".tr,
            //                               style: CustomTextStyles
            //                                   .sofiaProBlue800)))
            //                 ]),
            //                 Padding(
            //                     padding: EdgeInsets.only(
            //                         left: 2.h, top: 1.v, bottom: 1.v),
            //                     child: Text("lbl_gold".tr,
            //                         style: CustomTextStyles.bodySmallWhiteA700))
            //               ])),
            //       Align(
            //           alignment: Alignment.center,
            //           child: Column(
            //               mainAxisSize: MainAxisSize.min,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text("lbl_adeleke_omoniyi".tr,
            //                     style: CustomTextStyles.titleMediumWhiteA700_1),
            //                 Text("lbl_nigeria".tr,
            //                     style: CustomTextStyles.labelMediumBlue10001),
            //                 SizedBox(height: 11.v),
            //                 SizedBox(
            //                     width: 215.h,
            //                     child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text("lbl_used_23_4gb".tr,
            //                               style: CustomTextStyles
            //                                   .labelLargeSofiaProWhiteA700),
            //                           Text("lbl_out_of_100gb".tr,
            //                               style: CustomTextStyles
            //                                   .labelMediumBlue10001)
            //                         ])),
            //                 SizedBox(height: 3.v),
            //                 Container(
            //                     height: 5.v,
            //                     width: 215.h,
            //                     decoration: BoxDecoration(
            //                         color: appTheme.blue10001,
            //                         borderRadius: BorderRadius.circular(2.h)),
            //                     child: ClipRRect(
            //                         borderRadius: BorderRadius.circular(2.h),
            //                         child: LinearProgressIndicator(
            //                             value: 0.25,
            //                             backgroundColor: appTheme.blue10001,
            //                             valueColor:
            //                                 AlwaysStoppedAnimation<Color>(
            //                                     appTheme.amberA200))))
            //               ]))
            //     ]))
          ]),
        ));
  }

  /// Common widget
  Widget _buildCiSettingsFilled({
    required String userImage,
    required String settingsLabel,
  }) {
    return Row(children: [
      CustomImageView(
          imagePath: userImage,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(bottom: 1.v)),
      Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Text(settingsLabel,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.colorScheme.onPrimary)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapImgClose() {
    Get.back();
  }
}
