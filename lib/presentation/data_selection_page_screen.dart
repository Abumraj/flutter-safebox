import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/models/fileoptions_item_model.dart';
import 'package:safebox/models/getting_started_model.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/fileoptions_item_widget.dart';

class DataSelectionPageScreen extends StatefulWidget {
  const DataSelectionPageScreen({Key? key}) : super(key: key);

  @override
  State<DataSelectionPageScreen> createState() =>
      _DataSelectionPageScreenState();
}

class _DataSelectionPageScreenState extends State<DataSelectionPageScreen> {
  final Uploadanager uploadController = Get.put(Uploadanager());
  GettingStartedModel controller = Get.put(GettingStartedModel());

  List<FileoptionsItemModel> fileoptionsItemList = [
    FileoptionsItemModel(id: 1, productName: 'Documents'),
    FileoptionsItemModel(id: 2, productName: 'Photos'),
    FileoptionsItemModel(id: 3, productName: 'Audios'),
    FileoptionsItemModel(id: 4, productName: 'Videos'),
    FileoptionsItemModel(id: 5, productName: 'Contacts'),
    FileoptionsItemModel(id: 6, productName: 'Whatsapp'),
  ];
  bool isLoading = false;
  List<bool> backupOptions = [];

  @override
  void initState() {
    backupOptions = [];
    // productList();
    fileoptionsItemList.forEach((element) {
      controller.backupOptions.add(false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 28.h,
                  vertical: 36.v,
                ),
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 27.v),
                    child: Column(children: [
                      _buildFileOptions(),
                      SizedBox(height: 40.v),
                      CustomElevatedButton(
                        onPressed: () {
                          uploadController.backUpData(
                              controller.backupOptions[0],
                              controller.backupOptions[1],
                              controller.backupOptions[2],
                              controller.backupOptions[3],
                              controller.backupOptions[4],
                              controller.backupOptions[5]);
                          onTapArrowLeft();
                        },
                        height: 50.v,
                        text: "lbl_back_up".tr,
                        buttonStyle: CustomButtonStyles.outlinePrimary,
                        buttonTextStyle: CustomTextStyles
                            .titleMediumOpenSansWhiteA700SemiBold,
                      ),
                      SizedBox(height: 80.v),
                      // SizedBox(
                      //     height: 517.v,
                      //     width: double.maxFinite,
                      //     child: Stack(
                      //         alignment: Alignment.bottomCenter,
                      //         children: [
                      //         ]))
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

  Widget _buildFileOptions() {
    return Padding(
      padding: EdgeInsets.only(left: 4.h),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 20.v,
          );
        },
        itemCount: fileoptionsItemList.length,
        itemBuilder: (context, index) {
          FileoptionsItemModel model = fileoptionsItemList[index];
          return InkWell(
            onTap: () {
              if (model.checkmarkImage == true) {
                setState(() {
                  model.checkmarkImage == false;
                  backupOptions[index] = false;
                });
              } else {
                setState(() {
                  model.checkmarkImage == true;
                  backupOptions[index] = true;
                });
              }
              // controller.update();
            },
            child: FileoptionsItemWidget(
              model,
              index: index,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  // Widget _buildDataSelectionPage() {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 32.h, right: 28.h),
  //       child: Obx(() => ListView.separated(
  //           physics: const NeverScrollableScrollPhysics(),
  //           shrinkWrap: true,
  //           separatorBuilder: (context, index) {
  //             return SizedBox(height: 20.v);
  //           },
  //           itemCount: controller.dataSelectionPageModelObj.value
  //               .dataselectionpageItemList.value.length,
  //           itemBuilder: (context, index) {
  //             DataselectionpageItemModel model = controller
  //                 .dataSelectionPageModelObj
  //                 .value
  //                 .dataselectionpageItemList
  //                 .value[index];
  //             return DataselectionpageItemWidget(model);
  //           })));
  // }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
