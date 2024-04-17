import 'package:flutter/material.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_grid_view.dart';

class CopyToMyDesignScreen extends StatefulWidget {
  final int childId;
  final String title;
  const CopyToMyDesignScreen(
      {Key? key, required this.childId, required this.title})
      : super(key: key);

  @override
  State<CopyToMyDesignScreen> createState() => _CopyToMyDesignScreenState();
}

class _CopyToMyDesignScreenState extends State<CopyToMyDesignScreen> {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  ScrollController _scrollController = new ScrollController();
  bool isGridView = false;
  List<UserfilesItemModel> allFiles = [];
  bool isLoading = false;
  int page = 1;
  bool hasMore = false;
  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    recentFilesCall();
    // controller.addedFolderOneModelObj.value.
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void recentFilesCall() {
    setState(() {
      isLoading = true;
    });
    // ProgressDialogUtils.showProgressDialog();
    _apiRepositoryImplementation.getAllFiles(page).then((value) {
      setState(() {
        allFiles = value.items;
        hasMore = value.hasMoreItems;
        page = value.currentPage; // Assign the new list directly
        isLoading = false;
        // print(allFiles.length); // Assign the new list directly
      });
    });
  }

  Future<void> _loadMoreItems() async {
    if (!isLoading && hasMore) {
      setState(() {
        isLoading = true;
      });

      // Simulate loading delay
      await Future.delayed(Duration(seconds: 2));
      _apiRepositoryImplementation.getAllFiles(page + 1).then((value) {
        setState(() {
          allFiles.addAll(value.items);
          hasMore = value.hasMoreItems;
          page = value.currentPage;
          isLoading = false;
        });
      });
      // Load more items
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.minScrollExtent) {
      print("loadmore");
      _loadMoreItems();
    }
  }

  void recentFilesCallBack() {
    // ProgressDialogUtils.showProgressDialog();
    _apiRepositoryImplementation.getAllFiles(1).then((value) {
      setState(() {
        allFiles = value.items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(),
      body: SizedBox(
          width: mediaQueryData.size.width,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : allFiles.isEmpty
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
                      controller: _scrollController,
                      itemCount: allFiles.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        UserfilesItemModel item = allFiles[index];
                        return CustomGridView(
                          item: item,
                          childId: widget.childId,
                          reloadResource: recentFilesCallBack,
                          isCopy: widget.title.toLowerCase() == "move to"
                              ? false
                              : true,
                        );
                      })),
    ));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 12.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitleOne(
            text: widget.title, margin: EdgeInsets.only(left: 10.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgIcRoundCreateNewFolder,
              margin: EdgeInsets.fromLTRB(28.h, 13.v, 28.h, 12.v))
        ]);
  }

  /// Section Widget
  Widget _buildCopy() {
    return SizedBox(
        height: 82.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    right: 12.h,
                  ),
                  // decoration: AppDecoration.outlinePrimary.copyWith(
                  //     borderRadius: BorderRadiusStyle.customBorderTL30),
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
                            text: "lbl_copy".tr,
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
