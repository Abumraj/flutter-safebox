import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/models/fileoptions_item_model.dart';
import 'package:safebox/models/getting_started_model.dart';
import 'package:safebox/presentation/home_page_screen.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_outlined_button.dart';
import 'package:safebox/widgets/fileoptions_item_widget.dart';

// ignore_for_file: must_be_immutable
class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<GettingStartedScreen> createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  GettingStartedModel controller = Get.put(GettingStartedModel());

  final Uploadanager uploadController = Get.put(Uploadanager());

  List<FileoptionsItemModel> fileoptionsItemList = [
    // FileoptionsItemModel(id: 1, productName: 'Documents'),
    // FileoptionsItemModel(id: 2, productName: 'Photos'),
    // FileoptionsItemModel(id: 3, productName: 'Audios'),
    // FileoptionsItemModel(id: 4, productName: 'Videos'),
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

  // productList() {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   _apiRepositoryImplementation.getProductList().then((value) {
  //     fileoptionsItemList = value;
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 28.h,
                  vertical: 36.v,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgFlag,
                        height: 43.v,
                        width: 35.h,
                      ),
                      SizedBox(height: 14.v),
                      Text(
                        "lbl_get_started".tr,
                        style: CustomTextStyles.titleLargeOpenSansIndigo900,
                      ),
                      SizedBox(height: 6.v),
                      Text(
                        "msg_select_your_files".tr,
                        style: CustomTextStyles.bodyMedium_3,
                      ),
                      SizedBox(height: 43.v),
                      _buildFileOptions(),
                      SizedBox(height: 40.v),
                      InkWell(
                        onTap: () {
                          uploadController.backUpData(
                            backupOptions[0],
                            backupOptions[1],
                            // backupOptions[2],
                            // backupOptions[3],
                            // backupOptions[4],
                            // backupOptions[5]
                          );
                          Get.to(const HomePageScreen());
                        },
                        child: CustomElevatedButton(
                          height: 50.v,
                          text: "lbl_back_up".tr,
                          buttonStyle: CustomButtonStyles.outlinePrimary,
                          buttonTextStyle: CustomTextStyles
                              .titleMediumOpenSansWhiteA700SemiBold,
                        ),
                      ),
                      SizedBox(height: 20.v),
                      CustomOutlinedButton(
                        text: "lbl_later".tr,
                        buttonStyle: CustomButtonStyles.outlineBlue,
                        buttonTextStyle:
                            CustomTextStyles.titleMediumOpenSansBlue800,
                        onPressed: () {
                          Get.to(const HomePageScreen());
                        },
                      ),
                      SizedBox(height: 10.v),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFileOptions() {
    return Padding(
        padding: EdgeInsets.only(left: 4.h),
        child: Obx(() {
          return controller.isSelected.value == true
              ? ListView.separated(
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
                    return FileoptionsItemWidget(
                      model,
                      index: index,
                    );
                  })
              : ListView.separated(
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
                    return FileoptionsItemWidget(
                      model,
                      index: index,
                    );
                  });
        }));
  }
}
