import 'package:flutter/material.dart';
import 'package:safebox/controller/item_option_page_controller.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_grid_view.dart';

class CopyOrMoveScreen extends StatefulWidget {
  final String path;
  final String name;
  final int folderId;
  final int fileId;
  final bool isCopy;
  const CopyOrMoveScreen(
      {Key? key,
      required this.path,
      required this.folderId,
      required this.name,
      required this.isCopy,
      required this.fileId})
      : super(key: key);

  @override
  State<CopyOrMoveScreen> createState() => _MoveToMyDesignScreenState();
}

class _MoveToMyDesignScreenState extends State<CopyOrMoveScreen> {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  ItemOptionPageController controller = Get.put(ItemOptionPageController());
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  bool hasMore = false;
  List<UserfilesItemModel> recentFiles = [];
  bool isLoading = false;

  @override
  void initState() {
    recentFilesCall();
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void recentFilesCall() {
    setState(() {
      isLoading = true;
    });
    _apiRepositoryImplementation.getSubFolderFiles(widget.path).then((value) {
      setState(() {
        recentFiles = value.items;
        hasMore = value.hasMoreItems;
        page = value.currentPage; // Assign the new list directly
        isLoading = false;
        print(hasMore);
        // print(allFiles.length); // Assign the new list directly
      });
    });
  }

  void recentFilesCallBack() {
    _apiRepositoryImplementation
        .getSubFolderFiles(
      widget.path,
    )
        .then((value) {
      setState(() {
        recentFiles = value.items;
        hasMore = value.hasMoreItems;
        page = value.currentPage; // Assign the new list directly
        isLoading = false;
        print(hasMore);
        // print(allFiles.length); // Assign the new list directly
      });
    });
  }

  Future<void> _loadMoreItems() async {
    if (!isLoading && hasMore) {
      _apiRepositoryImplementation.getAllFiles(page + 1).then((value) {
        setState(() {
          recentFiles.addAll(value.items);
          hasMore = value.hasMoreItems;
          page = value.currentPage;
        });
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      print("loadmore");
      _loadMoreItems();
    }
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 4,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.blue,
            // Colors.white,
          ),
        ),
      ),
    );
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
                      controller: _scrollController,
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
                        if (index == recentFiles.length - 1 && hasMore) {
                          return _buildLoadingIndicator();
                        }
                        return CustomGridView(
                          item: item,
                          reloadResource: recentFilesCallBack,
                        );
                      })),
      bottomNavigationBar: BottomAppBar(
        height: 70.adaptSize,
        // color: Colors.white,
        elevation: 8,
        surfaceTintColor: Colors.white54,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: _buildCopy(),
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
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Text("lbl_cancel".tr,
                                  style: CustomTextStyles.titleMediumBlue800),
                            )),
                        CustomElevatedButton(
                            height: 35.v,
                            onPressed: () {
                              if (widget.isCopy) {
                                var data = {
                                  'fileId': widget.fileId,
                                  'folderId': widget.folderId,
                                };
                                controller.copyFileOrFolder(
                                    data, recentFilesCallBack);
                              } else {
                                var data = {
                                  'fileId': widget.fileId,
                                  'folderId': widget.folderId,
                                };
                                controller.moveFileOrFolder(
                                    data, recentFilesCallBack);
                              }
                            },
                            width: 99.h,
                            text: widget.isCopy ? "Paste" : "lbl_move".tr,
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
