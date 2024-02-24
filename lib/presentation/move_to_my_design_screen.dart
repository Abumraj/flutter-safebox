import 'package:flutter/material.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/presentation/add_upload_page_bottomsheet.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_grid_view.dart';

class MoveToMyDesignScreen extends StatefulWidget {
  final String path;
  final String name;
  final int folderId;
  const MoveToMyDesignScreen(
      {Key? key,
      required this.path,
      required this.folderId,
      required this.name})
      : super(key: key);

  @override
  State<MoveToMyDesignScreen> createState() => _MoveToMyDesignScreenState();
}

class _MoveToMyDesignScreenState extends State<MoveToMyDesignScreen> {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  List<UserfilesItemModel> recentFiles = [];
  bool isLoading = false;

  @override
  void initState() {
    recentFilesCall();
    super.initState();
  }

  void recentFilesCall() {
    setState(() {
      isLoading = true;
    });
    _apiRepositoryImplementation.getSubFolderFiles(widget.path).then((value) {
      setState(() {
        recentFiles = value;
        isLoading = false;
      });
    });
  }

  void recentFilesCallBack() {
    _apiRepositoryImplementation.getSubFolderFiles(widget.path).then((value) {
      setState(() {
        recentFiles = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(widget.name),
      body: SizedBox(
          width: mediaQueryData.size.width,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : recentFiles.isEmpty
                  ? SingleChildScrollView(
                      padding: EdgeInsets.only(top: 256.v),
                      child: Column(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgFolderGray200,
                            height: 47.adaptSize,
                            width: 47.adaptSize),
                        SizedBox(height: 14.v),
                        SizedBox(
                            width: 246.h,
                            child: Text("msg_you_have_no_files".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles
                                    .titleLargeOpenSansGray40001)),
                      ]))
                  : GridView.builder(
                      itemCount: recentFiles.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        UserfilesItemModel item = recentFiles[index];
                        return CustomGridView(
                          item: item,
                          reloadResource: recentFilesCallBack,
                        );
                      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(AddUploadPageBottomsheet(
            folderId: widget.folderId,
            functionCallBack: recentFilesCall,
          ));
        },
        backgroundColor: appTheme.blue800,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
    ));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(title) {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 12.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title:
            AppbarSubtitleOne(text: title, margin: EdgeInsets.only(left: 10.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgIcRoundCreateNewFolder,
              margin: EdgeInsets.fromLTRB(28.h, 13.v, 28.h, 12.v))
        ]);
  }

  /// Section Widget
  Widget _buildMove() {
    return SizedBox(
        height: 82.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.center,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 28.h),
                        child: Row(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgCarbonFolderGray40001,
                              height: 36.adaptSize,
                              width: 36.adaptSize),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 10.h, top: 8.v, bottom: 7.v),
                              child: Text("lbl_pictures".tr,
                                  style: CustomTextStyles
                                      .titleLargeSofiaProOnPrimaryMedium))
                        ])),
                    SizedBox(height: 19.v),
                    Divider(color: appTheme.gray200)
                  ])),
          Align(
              alignment: Alignment.center,
              child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 38.h, vertical: 23.v),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 9.v, bottom: 10.v),
                            child: Text("lbl_cancel".tr,
                                style: CustomTextStyles.titleMediumBlue800)),
                        CustomElevatedButton(
                            height: 35.v,
                            width: 99.h,
                            text: "lbl_move".tr,
                            margin: EdgeInsets.only(left: 20.h, top: 1.v),
                            buttonTextStyle:
                                CustomTextStyles.titleMediumWhiteA700)
                      ])))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
