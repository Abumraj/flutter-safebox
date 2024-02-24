import 'package:safebox/controller/data_selection_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/dataselectionpage_item_model.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_checkbox_button.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/dataselectionpage_item_widget.dart';

class DataSelectionPageScreen extends GetWidget<DataSelectionPageController> {
  DataSelectionPageScreen({Key? key}) : super(key: key);
  final DataSelectionPageController dataSelectionPageController =
      Get.put(DataSelectionPageController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 27.v),
                    child: Column(children: [
                      _buildDataSelectionPage(),
                      SizedBox(height: 240.v),
                      CustomElevatedButton(
                          height: 50.v,
                          text: "lbl_back_up".tr,
                          margin: EdgeInsets.only(left: 30.h, right: 28.h),
                          buttonStyle: CustomButtonStyles.outlinePrimary,
                          buttonTextStyle: CustomTextStyles
                              .titleMediumOpenSansWhiteA700SemiBold),
                      SizedBox(height: 80.v),
                      SizedBox(
                          height: 517.v,
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                _buildUploadToSavebox(),
                                _buildKeyboards1()
                              ]))
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
            text: "lbl_backup_data".tr, margin: EdgeInsets.only(left: 11.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 13.v))
        ]);
  }

  /// Section Widget
  Widget _buildDataSelectionPage() {
    return Padding(
        padding: EdgeInsets.only(left: 32.h, right: 28.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.v);
            },
            itemCount: controller.dataSelectionPageModelObj.value
                .dataselectionpageItemList.value.length,
            itemBuilder: (context, index) {
              DataselectionpageItemModel model = controller
                  .dataSelectionPageModelObj
                  .value
                  .dataselectionpageItemList
                  .value[index];
              return DataselectionpageItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildUploadToSavebox() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 29.h),
            decoration:
                BoxDecoration(borderRadius: BorderRadiusStyle.customBorderTL30),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 156.v,
                      width: 316.h,
                      margin: EdgeInsets.only(left: 1.h),
                      child: Stack(alignment: Alignment.topRight, children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 20.v),
                                child: Text("lbl_add_to_savebox".tr,
                                    style: theme.textTheme.labelLarge))),
                        CustomImageView(
                            imagePath: ImageConstant.imgClose,
                            height: 10.adaptSize,
                            width: 10.adaptSize,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 25.v)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Obx(() => CustomCheckboxButton(
                                alignment: Alignment.centerLeft,
                                text: "lbl_create_folder".tr,
                                value: controller.createfolder.value,
                                onChange: (value) {
                                  controller.createfolder.value = value;
                                }))),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 35.v),
                                child: Obx(() => CustomCheckboxButton(
                                    alignment: Alignment.bottomLeft,
                                    text: "lbl_upload_files".tr,
                                    value: controller.uploadfiles.value,
                                    onChange: (value) {
                                      controller.uploadfiles.value = value;
                                    })))),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Obx(() => CustomCheckboxButton(
                                alignment: Alignment.bottomLeft,
                                text: "msg_upload_photos_and".tr,
                                value: controller.uploadphotosandvideos.value,
                                onChange: (value) {
                                  controller.uploadphotosandvideos.value =
                                      value;
                                }))),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                margin: EdgeInsets.only(right: 1.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.h, vertical: 14.v),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder10),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("lbl_new_folder".tr,
                                          style: theme.textTheme.labelLarge),
                                      SizedBox(height: 15.v),
                                      Container(
                                          width: 275.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 14.h, vertical: 4.v),
                                          decoration: AppDecoration.outlineGray
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder5),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 1.v),
                                                SizedBox(
                                                    width: 80.h,
                                                    child: Text(
                                                        "lbl_folder_name".tr,
                                                        maxLines: null,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: theme.textTheme
                                                            .titleSmall!
                                                            .copyWith(
                                                                height: 2.71)))
                                              ])),
                                      SizedBox(height: 20.v),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 8.v, bottom: 7.v),
                                                    child: Text("lbl_cancel".tr,
                                                        style: CustomTextStyles
                                                            .labelLargeSofiaProBlue800)),
                                                CustomElevatedButton(
                                                    height: 30.v,
                                                    width: 74.h,
                                                    text: "lbl_create".tr,
                                                    margin: EdgeInsets.only(
                                                        left: 15.h))
                                              ]))
                                    ])))
                      ])),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: Obx(() => CustomCheckboxButton(
                          text: "lbl_upload_contacts".tr,
                          value: controller.uploadcontacts.value,
                          onChange: (value) {
                            controller.uploadcontacts.value = value;
                          }))),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: Obx(() => CustomCheckboxButton(
                          text: "lbl_scan_document".tr,
                          value: controller.scandocument.value,
                          onChange: (value) {
                            controller.scandocument.value = value;
                          }))),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: Obx(() => CustomCheckboxButton(
                          text: "lbl_upload_audio".tr,
                          value: controller.uploadaudio.value,
                          onChange: (value) {
                            controller.uploadaudio.value = value;
                          }))),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h, right: 91.h),
                      child: Obx(() => CustomCheckboxButton(
                          text: "msg_upload_whatsapp".tr,
                          value: controller.uploadwhatsappbackup.value,
                          onChange: (value) {
                            controller.uploadwhatsappbackup.value = value;
                          }))),
                  SizedBox(height: 30.v)
                ])));
  }

  /// Section Widget
  Widget _buildKeyboards1() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
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
                            style:
                                CustomTextStyles.bodyLargeSFProTextWhiteA700)),
                    SizedBox(
                        height: 42.v,
                        child: VerticalDivider(width: 1.h, thickness: 1.v)),
                    Padding(
                        padding: EdgeInsets.only(top: 8.v, bottom: 12.v),
                        child: Text("lbl_the".tr,
                            textAlign: TextAlign.center,
                            style:
                                CustomTextStyles.bodyLargeSFProTextWhiteA700)),
                    SizedBox(
                        height: 42.v,
                        child: VerticalDivider(width: 1.h, thickness: 1.v)),
                    Padding(
                        padding: EdgeInsets.only(top: 8.v, bottom: 12.v),
                        child: Text("lbl_i_m".tr,
                            textAlign: TextAlign.center,
                            style:
                                CustomTextStyles.bodyLargeSFProTextWhiteA700))
                  ])),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 10.v),
              decoration: AppDecoration.fillBlueGrayE,
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_q".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_w".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_e".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.all(7.h),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_r".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_t".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.all(7.h),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_y".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.all(7.h),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_u".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_i".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 7.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_o".tr,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 31.h,
                          padding: EdgeInsets.all(7.h),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Text("lbl_p".tr,
                              style: theme.textTheme.titleLarge))
                    ]),
                SizedBox(height: 12.v),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.h),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 31.h,
                              padding: EdgeInsets.all(7.h),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_a".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.all(7.h),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_s".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_d".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_f".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_g".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_h".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_j".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.all(7.h),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_k".tr,
                                  style: theme.textTheme.titleLarge)),
                          Container(
                              width: 31.h,
                              margin: EdgeInsets.only(left: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Text("lbl_l".tr,
                                  style: theme.textTheme.titleLarge))
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
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_z".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_x".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_c".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_v".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.all(7.h),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_b".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.h, vertical: 7.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_n".tr, style: theme.textTheme.titleLarge)),
                  Container(
                      width: 31.h,
                      margin: EdgeInsets.only(left: 6.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.h, vertical: 7.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child:
                          Text("lbl_m".tr, style: theme.textTheme.titleLarge)),
                  CustomImageView(
                      imagePath: ImageConstant.imgCloseBlueGray200,
                      height: 42.adaptSize,
                      width: 42.adaptSize,
                      margin: EdgeInsets.only(left: 14.h))
                ]),
                SizedBox(height: 10.v),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                    style: CustomTextStyles
                                        .bodyLargeSFProTextBlack900))
                          ])),
                      Container(
                          width: 184.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.h, vertical: 11.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_spac".tr,
                                    style: CustomTextStyles
                                        .bodyLargeSFProTextBlack900_1),
                                TextSpan(
                                    text: "lbl_e2".tr,
                                    style: CustomTextStyles
                                        .bodyLargeSFProTextBlack900_2)
                              ]),
                              textAlign: TextAlign.center)),
                      CustomElevatedButton(
                          width: 87.h,
                          text: "lbl_return".tr,
                          buttonStyle: CustomButtonStyles.outlineBlackTL5,
                          buttonTextStyle:
                              CustomTextStyles.bodyLargeSFProTextBlack900)
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
              ]))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
