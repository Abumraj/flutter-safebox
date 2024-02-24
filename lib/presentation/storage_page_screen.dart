import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/controller/storage_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/filesection_item_model.dart';
import 'package:safebox/widgets/filesection_item_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StoragePageScreen extends StatefulWidget {
  StoragePageScreen({Key? key}) : super(key: key);

  @override
  State<StoragePageScreen> createState() => _StoragePageScreenState();
}

class _StoragePageScreenState extends State<StoragePageScreen> {
  final StoragePageController controller = Get.put(StoragePageController());

  final AccountController accountController = Get.put(AccountController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double percentStorage = (ProgressDialogUtils.getSizeComparableValue(
                accountController.accountModelObj.value.usedStorage) /
            ProgressDialogUtils.getSizeComparableValue(
                accountController.accountModelObj.value.totalStorage)) *
        100;
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 18.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(children: [
                        _buildUpgradeSection(),
                        CircularPercentIndicator(
                          animation: true,
                          backgroundColor: appTheme.indigo30016,
                          radius: 80.0,
                          lineWidth: 25.0,
                          percent: ProgressDialogUtils.getSizeComparableValue(
                                  accountController
                                      .accountModelObj.value.usedStorage) /
                              ProgressDialogUtils.getSizeComparableValue(
                                  accountController
                                      .accountModelObj.value.totalStorage),
                          startAngle: 45,
                          center: Text("${percentStorage.roundToDouble()}%"),
                          progressColor: appTheme.blue800,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                  height: 50.v,
                                  width: 286.h,
                                  child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Align(
                                            alignment: Alignment.bottomLeft,
                                            child: SizedBox(
                                                height: 50.v,
                                                width: 221.h,
                                                child: Stack(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          86.h,
                                                                      vertical:
                                                                          65.v),
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            27.v),
                                                                    Text(
                                                                        "${accountController.accountModelObj.value.usedStorage}"
                                                                            .tr,
                                                                        style: CustomTextStyles
                                                                            .headlineSmallOpenSansOnPrimary)
                                                                  ]))),
                                                      Align(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          3.h),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Container(
                                                                        height: 20
                                                                            .adaptSize,
                                                                        width: 20
                                                                            .adaptSize,
                                                                        margin: EdgeInsets.only(
                                                                            top: 6
                                                                                .v,
                                                                            bottom: 5
                                                                                .v),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                appTheme.indigo50,
                                                                            borderRadius: BorderRadius.circular(4.h),
                                                                            boxShadow: [
                                                                              BoxShadow(color: appTheme.indigo30016, spreadRadius: 2.h, blurRadius: 2.h, offset: const Offset(0, 2))
                                                                            ])),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            left: 10
                                                                                .h),
                                                                        child: Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text("lbl_total_space".tr, style: theme.textTheme.bodySmall),
                                                                              SizedBox(height: 1.v),
                                                                              Text("${accountController.accountModelObj.value.totalStorage}", style: CustomTextStyles.titleMedium18_1)
                                                                            ]))
                                                                  ]))),
                                                      Align(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          7.h),
                                                              child: Row(
                                                                  children: [
                                                                    Container(
                                                                        height: 20
                                                                            .adaptSize,
                                                                        width: 20
                                                                            .adaptSize,
                                                                        margin: EdgeInsets.only(
                                                                            top: 6
                                                                                .v,
                                                                            bottom: 5
                                                                                .v),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                appTheme.blue800,
                                                                            borderRadius: BorderRadius.circular(4.h))),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            left: 10
                                                                                .h),
                                                                        child: Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text("lbl_used".tr, style: theme.textTheme.bodySmall),
                                                                              SizedBox(height: 3.v),
                                                                              Text("${accountController.accountModelObj.value.usedStorage}".tr, style: CustomTextStyles.titleMedium18_1)
                                                                            ]))
                                                                  ])))
                                                    ]))),
                                      ]))),
                        ),
                        SizedBox(height: 61.v),
                        _buildFileSection(),
                        SizedBox(height: 10.v),
                      ])))
                    ]))));
  }

  /// Section Widget
  Widget _buildUpgradeSection() {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 12.h, bottom: 0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 30.v,
                  width: 34.h,
                  margin: EdgeInsets.only(top: 10.v),
                  onTap: () {
                    onTapImgArrowLeft();
                  }),
              Container(
                  // height: 278.v,
                  width: 299.h,
                  margin: EdgeInsets.only(left: 10.h),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.only(top: 3.v),
                            child: Text("lbl_storage".tr,
                                style: theme.textTheme.headlineMedium))),
                    CustomImageView(
                        imagePath: ImageConstant.imgOverflowMenu,
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(right: 18.h))
                  ]))
            ]));
  }

  /// Section Widget
  Widget _buildFileSection() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Obx(() => ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 30.v);
            },
            itemCount: controller
                .storagePageModelObj.value.filesectionItemList.value.length,
            itemBuilder: (context, index) {
              FilesectionItemModel model = controller
                  .storagePageModelObj.value.filesectionItemList.value[index];
              return FilesectionItemWidget(model);
            })));
  }

  /// Section Widget

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
