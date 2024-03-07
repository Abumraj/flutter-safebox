import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:safebox/controller/upgrade_storage_controller.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/plan_model.dart';
import 'package:safebox/presentation/payment_screen.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_checkbox_button.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_icon_button.dart';
import 'package:safebox/widgets/custom_radio_button.dart';

class UpgradeStorageScreen extends StatefulWidget {
  const UpgradeStorageScreen({Key? key}) : super(key: key);

  @override
  State<UpgradeStorageScreen> createState() => _UpgradeStorageScreenState();
}

class _UpgradeStorageScreenState extends State<UpgradeStorageScreen> {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  List<Plan> fileoptionsItemList = [];
  bool isLoading = false;
  int amountToPay = 0;
  String plancode = '';
  int subscriptionId = 0;
  bool getAccessCode = false;
  final UpgradeStorageController controller =
      Get.put(UpgradeStorageController());

  planList() {
    setState(() {
      isLoading = true;
    });
    _apiRepositoryImplementation.getUserPlans().then((value) {
      fileoptionsItemList = value;
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    planList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : getAccessCode
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue,
                            // Colors.white,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: mediaQueryData.size.width,
                        child: SingleChildScrollView(
                            padding: EdgeInsets.only(top: 34.v),
                            child: Column(children: [
                              _buildFreeRow(),
                              SizedBox(height: 20.v),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    amountToPay =
                                        fileoptionsItemList[2].planPrice;
                                    plancode = fileoptionsItemList[2].planCode;
                                    subscriptionId = fileoptionsItemList[2].id;
                                  });
                                },
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 113.h),
                                    decoration: AppDecoration.outlineAmberA
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder5),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15.h),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            height:
                                                                16.adaptSize,
                                                            width: 16.adaptSize,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 11.v),
                                                            decoration: BoxDecoration(
                                                                color: appTheme
                                                                    .whiteA700,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(8
                                                                            .h),
                                                                border: Border.all(
                                                                    color: appTheme
                                                                        .gray40001,
                                                                    width:
                                                                        1.h))),
                                                        _buildGoldButton()
                                                      ]))),
                                          SizedBox(height: 11.v),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.h),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text:
                                                            "₦${fileoptionsItemList[2].planPrice}"
                                                                .tr,
                                                        style: theme.textTheme
                                                            .headlineSmall),
                                                    TextSpan(
                                                        text: "lbl_mo".tr,
                                                        style: CustomTextStyles
                                                            .titleMediumOnPrimaryContainer)
                                                  ]),
                                                  textAlign: TextAlign.left)),
                                          SizedBox(height: 13.v),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.h),
                                              child: Row(children: [
                                                Container(
                                                    height: 10.adaptSize,
                                                    width: 10.adaptSize,
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                            horizontal: 2.h,
                                                            vertical: 1.v),
                                                    decoration: AppDecoration
                                                        .outlineIndigo
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgRectangle4175,
                                                        height: 3.adaptSize,
                                                        width: 3.adaptSize,
                                                        alignment: Alignment
                                                            .topCenter)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5.h),
                                                    child: Text(
                                                        "lbl_no_ads2".tr,
                                                        style: theme.textTheme
                                                            .labelMedium))
                                              ])),
                                          SizedBox(height: 10.v),
                                          _buildRadioGroup(),
                                          SizedBox(height: 15.v)
                                        ])),
                              ),
                              SizedBox(height: 60.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 30.h),
                                      child: Text("lbl_payment_method".tr,
                                          style:
                                              theme.textTheme.headlineSmall))),
                              SizedBox(height: 19.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 30.h),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 30.h),
                                          child: DottedBorder(
                                              color: appTheme.indigo900,
                                              padding: EdgeInsets.only(
                                                  left: 1.h,
                                                  top: 1.v,
                                                  right: 1.h,
                                                  bottom: 1.v),
                                              strokeWidth: 1.h,
                                              radius: const Radius.circular(25),
                                              borderType: BorderType.RRect,
                                              dashPattern: [3, 3],
                                              child: CustomIconButton(
                                                  height: 50.adaptSize,
                                                  width: 50.adaptSize,
                                                  padding: EdgeInsets.all(16.h),
                                                  decoration:
                                                      IconButtonStyleHelper
                                                          .outlineIndigo,
                                                  child: CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgPlusIndigo900)))))),
                              SizedBox(height: 40.v),
                              _buildPayButton(),
                              SizedBox(height: 60.v),
                            ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarTitle(
            text: "lbl_upgrade".tr, margin: EdgeInsets.only(left: 10.h)));
  }

  /// Section Widget
  Widget _buildFreeButton() {
    return CustomElevatedButton(
        height: 23.v,
        width: 61.h,
        text: "lbl_free".tr,
        margin: EdgeInsets.only(bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillGreen);
  }

  /// Section Widget
  Widget _buildSilverButton() {
    return CustomElevatedButton(
        height: 23.v,
        width: 61.h,
        text: "lbl_silver".tr,
        margin: EdgeInsets.only(bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillBlueBL5);
  }

  /// Section Widget
  Widget _buildFreeRow() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            onTap: () {
              setState(() {
                amountToPay = fileoptionsItemList[0].planPrice;
                plancode = fileoptionsItemList[0].planCode;
                subscriptionId = fileoptionsItemList[0].id;
              });
            },
            child: Container(
                decoration: AppDecoration.outlineGreen
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              width: 133.h,
                              margin: EdgeInsets.only(left: 15.h),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: 11.v),
                                        padding: EdgeInsets.all(1.h),
                                        decoration: AppDecoration.outlineBlue200
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10),
                                        child: Container(
                                            height: 10.adaptSize,
                                            width: 10.adaptSize,
                                            decoration: BoxDecoration(
                                                color: appTheme.blue800,
                                                borderRadius:
                                                    BorderRadius.circular(5.h),
                                                border: Border.all(
                                                    color: appTheme.blue800,
                                                    width: 1.h)))),
                                    _buildFreeButton()
                                  ]))),
                      SizedBox(height: 12.v),
                      Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "₦${fileoptionsItemList[0].planPrice}"
                                        .tr,
                                    style: theme.textTheme.headlineSmall),
                                TextSpan(
                                    text: "lbl_mo".tr,
                                    style: CustomTextStyles
                                        .titleMediumOnPrimaryContainer)
                              ]),
                              textAlign: TextAlign.left)),
                      SizedBox(height: 12.v),
                      Obx(() => Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: CustomRadioButton(
                              text:
                                  "${fileoptionsItemList[0].planStorage} Storage"
                                      .tr,
                              value: "lbl_10_gb_storage".tr,
                              groupValue: controller.radioGroup.value,
                              onChange: (value) {
                                controller.radioGroup.value = value;
                              }))),
                      SizedBox(height: 34.v)
                    ])),
          ),
          InkWell(
            onTap: () {
              setState(() {
                amountToPay = fileoptionsItemList[1].planPrice;
                plancode = fileoptionsItemList[1].planCode;
                subscriptionId = fileoptionsItemList[1].id;
              });
            },
            child: Container(
                margin: EdgeInsets.only(left: 19.h),
                decoration: AppDecoration.outlineBlue800
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              width: 120.h,
                              margin: EdgeInsets.only(left: 12.h),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 16.adaptSize,
                                        width: 16.adaptSize,
                                        margin: EdgeInsets.only(top: 11.v),
                                        decoration: BoxDecoration(
                                            color: appTheme.whiteA700,
                                            borderRadius:
                                                BorderRadius.circular(8.h),
                                            border: Border.all(
                                                color: appTheme.gray40001,
                                                width: 1.h))),
                                    _buildSilverButton()
                                  ]))),
                      SizedBox(height: 11.v),
                      Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "₦${fileoptionsItemList[1].planPrice}"
                                        .tr,
                                    style: theme.textTheme.headlineSmall),
                                TextSpan(
                                    text: "lbl_mo".tr,
                                    style: CustomTextStyles
                                        .titleMediumOnPrimaryContainer)
                              ]),
                              textAlign: TextAlign.left)),
                      SizedBox(height: 13.v),
                      Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: Row(children: [
                            Container(
                                height: 10.adaptSize,
                                width: 10.adaptSize,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.h, vertical: 1.v),
                                decoration: AppDecoration.outlineIndigo
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder5),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgRectangle4175,
                                    height: 3.adaptSize,
                                    width: 3.adaptSize,
                                    alignment: Alignment.topCenter)),
                            Padding(
                                padding: EdgeInsets.only(left: 5.h),
                                child: Text("lbl_no_ads".tr,
                                    style: theme.textTheme.labelMedium))
                          ])),
                      SizedBox(height: 10.v),
                      Obx(() => Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: CustomRadioButton(
                              text:
                                  "${fileoptionsItemList[1].planStorage} Storage"
                                      .tr,
                              value: "lbl_50_gb_storage".tr,
                              groupValue: controller.radioGroup1.value,
                              onChange: (value) {
                                controller.radioGroup1.value = value;
                              }))),
                      SizedBox(height: 14.v)
                    ])),
          )
        ]));
  }

  /// Section Widget
  Widget _buildGoldButton() {
    return CustomElevatedButton(
        height: 23.v,
        width: 61.h,
        text: "lbl_gold".tr,
        margin: EdgeInsets.only(bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillAmberA);
  }

  /// Section Widget
  Widget _buildRadioGroup() {
    return Padding(
        padding: EdgeInsets.only(left: 15.h),
        child: Obx(() => Column(children: [
              Padding(
                  padding: EdgeInsets.only(right: 23.h),
                  child: CustomRadioButton(
                      text: "₦${fileoptionsItemList[2].planStorage}".tr,
                      value: controller
                          .upgradeStorageModelObj.value.radioList.value[0],
                      groupValue: controller.radioGroup2.value,
                      onChange: (value) {
                        controller.radioGroup2.value = value;
                      })),
              Padding(
                  padding: EdgeInsets.only(top: 8.v),
                  child: CustomRadioButton(
                      text: "msg_get_paid_on_referral".tr,
                      value: controller
                          .upgradeStorageModelObj.value.radioList.value[1],
                      groupValue: controller.radioGroup2.value,
                      onChange: (value) {
                        controller.radioGroup2.value = value;
                      }))
            ])));
  }

  /// Section Widget
  Widget _buildPayButton() {
    return CustomElevatedButton(
        onPressed: () async {
          if (amountToPay > 0) {
            setState(() {
              getAccessCode = true;
              // ProgressDialogUtils.showProgressDialog();
            });
            await _apiRepositoryImplementation
                .getAccessCode(amountToPay, plancode)
                .then((value) {
              String authorizedUrl =
                  value["paystack"]["data"]['authorization_url'];
              String reference = value["paystack"]["data"]['reference'];
              String callBackUrl = value["callback_url"];
              // ProgressDialogUtils.hideProgressDialog();
              Get.to(PaymentScreen(
                  authorizedUrl, reference, callBackUrl, subscriptionId));
            });
            setState(() {
              getAccessCode = true;
              // ProgressDialogUtils.showProgressDialog();
            });
          }
        },
        height: 50.v,
        text: amountToPay > 0 ? "Pay ₦$amountToPay" : "lbl_pay".tr,
        margin: EdgeInsets.symmetric(horizontal: 30.h),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL5,
        buttonTextStyle: CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
