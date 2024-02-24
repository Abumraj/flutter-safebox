import 'package:safebox/controller/storage_page_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/userfilessection_item_model.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_text_form_field.dart';
import 'package:safebox/widgets/userfilessection_item_widget.dart';

class StoragePageOneScreen extends GetWidget<StoragePageOneController> {
  const StoragePageOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 18.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    _buildUpgradeSection(),
                    SizedBox(height: 62.v),
                    _buildUserFilesSection(),
                    SizedBox(height: 193.v),
                   
                  ])))
                ]))));
  }

  /// Section Widget
  Widget _buildUpgradeSection() {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 12.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 30.v,
                  width: 34.h,
                  margin: EdgeInsets.only(bottom: 248.v),
                  onTap: () {
                    onTapImgArrowLeft();
                  }),
              Container(
                  height: 278.v,
                  width: 299.h,
                  margin: EdgeInsets.only(left: 10.h),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.only(top: 3.v),
                            child: Text("lbl_storage".tr,
                                style: theme.textTheme.headlineMedium))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                            height: 248.v,
                            width: 285.h,
                            child:
                                Stack(alignment: Alignment.topRight, children: [
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: SizedBox(
                                      height: 218.v,
                                      width: 221.h,
                                      child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 86.h,
                                                            vertical: 65.v),
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: fs.Svg(
                                                                ImageConstant
                                                                    .imgGroup95Indigo50),
                                                            fit: BoxFit.cover)),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          SizedBox(
                                                              height: 27.v),
                                                          Text("lbl_70".tr,
                                                              style: CustomTextStyles
                                                                  .headlineSmallOpenSansOnPrimary)
                                                        ]))),
                                            Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 5.h),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                              height:
                                                                  20.adaptSize,
                                                              width:
                                                                  20.adaptSize,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 6.v,
                                                                      bottom:
                                                                          5.v),
                                                              decoration: BoxDecoration(
                                                                  color: appTheme
                                                                      .indigo50,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.h))),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.h),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        "lbl_total_space"
                                                                            .tr,
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodySmall),
                                                                    SizedBox(
                                                                        height:
                                                                            1.v),
                                                                    Text(
                                                                        "lbl_100gb"
                                                                            .tr,
                                                                        style: CustomTextStyles
                                                                            .titleMedium18_1)
                                                                  ]))
                                                        ]))),
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5.h),
                                                    child: Row(children: [
                                                      Container(
                                                          height: 20.adaptSize,
                                                          width: 20.adaptSize,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 6.v,
                                                                  bottom: 5.v),
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .blue800,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.h))),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.h),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "lbl_used"
                                                                        .tr,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodySmall),
                                                                SizedBox(
                                                                    height:
                                                                        3.v),
                                                                Text(
                                                                    "lbl_70_6gb"
                                                                        .tr,
                                                                    style: CustomTextStyles
                                                                        .titleMedium18_1)
                                                              ]))
                                                    ])))
                                          ]))),
                              CustomTextFormField(
                                  width: 153.h,
                                  controller: controller.upgradeController,
                                  hintText: "lbl_upgrade".tr,
                                  hintStyle:
                                      CustomTextStyles.bodyMediumOnPrimary,
                                  textInputAction: TextInputAction.done,
                                  alignment: Alignment.topRight,
                                  borderDecoration:
                                      TextFormFieldStyleHelper.outlineBlueTL10)
                            ]))),
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
  Widget _buildUserFilesSection() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 30.v);
            },
            itemCount: controller.storagePageOneModelObj.value
                .userfilessectionItemList.value.length,
            itemBuilder: (context, index) {
              UserfilessectionItemModel model = controller
                  .storagePageOneModelObj
                  .value
                  .userfilessectionItemList
                  .value[index];
              return UserfilessectionItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildOverridesKeyboSection() {
    return Container(
        width: double.maxFinite,
        decoration: AppDecoration.fillBlueGray,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8.v, bottom: 12.v),
                  child: Text("lbl_i".tr,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyLargeSFProTextWhiteA700)),
              SizedBox(
                  height: 42.v,
                  child: VerticalDivider(width: 1.h, thickness: 1.v)),
              Padding(
                  padding: EdgeInsets.only(top: 8.v, bottom: 12.v),
                  child: Text("lbl_the".tr,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyLargeSFProTextWhiteA700)),
              SizedBox(
                  height: 42.v,
                  child: VerticalDivider(width: 1.h, thickness: 1.v)),
              Padding(
                  padding: EdgeInsets.only(top: 8.v, bottom: 12.v),
                  child: Text("lbl_i_m".tr,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyLargeSFProTextWhiteA700))
            ]));
  }

  /// Section Widget
  Widget _buildStoragePageOneSection() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 10.v),
        decoration: AppDecoration.fillBlueGrayE,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                width: 31.h,
                padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_q".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 7.v),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_w".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 7.v),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_e".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                padding: EdgeInsets.all(7.h),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_r".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 7.v),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_t".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                padding: EdgeInsets.all(7.h),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_y".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                padding: EdgeInsets.all(7.h),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_u".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 7.v),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_i".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_o".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                padding: EdgeInsets.all(7.h),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_p".tr, style: theme.textTheme.titleLarge))
          ]),
          SizedBox(height: 12.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    width: 31.h,
                    padding: EdgeInsets.all(7.h),
                    decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Text("lbl_a".tr, style: theme.textTheme.titleLarge)),
                Container(
                    width: 31.h,
                    margin: EdgeInsets.only(left: 6.h),
                    padding: EdgeInsets.all(7.h),
                    decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Text("lbl_s".tr, style: theme.textTheme.titleLarge)),
                Container(
                    width: 31.h,
                    margin: EdgeInsets.only(left: 6.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                    decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Text("lbl_d".tr, style: theme.textTheme.titleLarge)),
                Container(
                    width: 31.h,
                    margin: EdgeInsets.only(left: 6.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.h, vertical: 7.v),
                    decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Text("lbl_f".tr, style: theme.textTheme.titleLarge)),
                Container(
                    width: 31.h,
                    margin: EdgeInsets.only(left: 6.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                    decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Text("lbl_g".tr, style: theme.textTheme.titleLarge)),
                Container(
                    width: 31.h,
                    margin: EdgeInsets.only(left: 6.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                    decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Text("lbl_h".tr, style: theme.textTheme.titleLarge)),
                Container(
                    width: 31.h,
                    margin: EdgeInsets.only(left: 6.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 9.h, vertical: 7.v),
                    decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Text("lbl_j".tr, style: theme.textTheme.titleLarge)),
                Container(
                    width: 31.h,
                    margin: EdgeInsets.only(left: 6.h),
                    padding: EdgeInsets.all(7.h),
                    decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Text("lbl_k".tr, style: theme.textTheme.titleLarge)),
                Container(
                    width: 31.h,
                    margin: EdgeInsets.only(left: 6.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.h, vertical: 7.v),
                    decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Text("lbl_l".tr, style: theme.textTheme.titleLarge))
              ])),
          SizedBox(height: 12.v),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomImageView(
                imagePath: ImageConstant.imgArrowUp,
                height: 42.adaptSize,
                width: 42.adaptSize),
            Container(
                width: 31.h,
                margin: EdgeInsets.only(left: 14.h),
                padding: EdgeInsets.all(7.h),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_z".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                margin: EdgeInsets.only(left: 6.h),
                padding: EdgeInsets.all(7.h),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_x".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                margin: EdgeInsets.only(left: 6.h),
                padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_c".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                margin: EdgeInsets.only(left: 6.h),
                padding: EdgeInsets.all(7.h),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_v".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                margin: EdgeInsets.only(left: 6.h),
                padding: EdgeInsets.all(7.h),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_b".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                margin: EdgeInsets.only(left: 6.h),
                padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_n".tr, style: theme.textTheme.titleLarge)),
            Container(
                width: 31.h,
                margin: EdgeInsets.only(left: 6.h),
                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 7.v),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Text("lbl_m".tr, style: theme.textTheme.titleLarge)),
            CustomImageView(
                imagePath: ImageConstant.imgCloseBlueGray200,
                height: 42.adaptSize,
                width: 42.adaptSize,
                margin: EdgeInsets.only(left: 14.h))
          ]),
          SizedBox(height: 10.v),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
                height: 42.v,
                width: 87.h,
                child: Stack(alignment: Alignment.center, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgKey,
                      height: 42.v,
                      width: 87.h,
                      radius: BorderRadius.circular(5.h),
                      alignment: Alignment.center),
                  Align(
                      alignment: Alignment.center,
                      child: Text("lbl_123".tr,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyLargeSFProTextBlack900))
                ])),
            Container(
                width: 184.h,
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 11.v),
                decoration: AppDecoration.outlineBlack
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "lbl_spac".tr,
                          style: CustomTextStyles.bodyLargeSFProTextBlack900_1),
                      TextSpan(
                          text: "lbl_e2".tr,
                          style: CustomTextStyles.bodyLargeSFProTextBlack900_2)
                    ]),
                    textAlign: TextAlign.center)),
            CustomElevatedButton(
                width: 87.h,
                text: "lbl_return".tr,
                buttonStyle: CustomButtonStyles.outlineBlackTL5,
                buttonTextStyle: CustomTextStyles.bodyLargeSFProTextBlack900)
          ]),
          SizedBox(height: 28.v),
          Padding(
              padding: EdgeInsets.only(left: 21.h, right: 27.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgEmoji,
                        height: 26.adaptSize,
                        width: 26.adaptSize),
                    CustomImageView(
                        imagePath: ImageConstant.imgMap,
                        height: 25.v,
                        width: 15.h)
                  ])),
          SizedBox(height: 14.v)
        ]));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
