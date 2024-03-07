import 'package:flutter/material.dart';
import 'package:safebox/controller/starred_files_controller.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/starred_files_model.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/presentation/navigation_page_screen.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_grid_view.dart';
import 'package:safebox/widgets/custom_list_view.dart';
import 'package:safebox/widgets/custom_recent_files.dart';
import 'package:safebox/widgets/custom_search_view.dart';
import 'package:simple_grouped_listview/simple_grouped_listview.dart';

// ignore: must_be_immutable
class StarredFilesPage extends StatefulWidget {
  const StarredFilesPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<StarredFilesPage> createState() => _StarredFilesPageState();
}

class _StarredFilesPageState extends State<StarredFilesPage> {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollController = new ScrollController();
  bool isGridView = false;
  List<UserfilesItemModel> starredFiles = [];
  bool isLoading = false;
  @override
  void initState() {
    recentFilesCall();
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
    _apiRepositoryImplementation.getStarredFiles().then((value) {
      setState(() {
        starredFiles = value; // Assign the new list directly
        isLoading = false;
        print(starredFiles.length); // Assign the new list directly
      });
    });
  }

  void recentFilesCallBack() {
    // ProgressDialogUtils.showProgressDialog();
    _apiRepositoryImplementation.getStarredFiles().then((value) {
      setState(() {
        starredFiles = value;
      });
    });
  }

  sortAscending() {
    setState(() {
      // sorter = 1;
      starredFiles.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
    });
  }

  sortBySizeAscending() {
    setState(() {
      starredFiles.sort((a, b) =>
          ProgressDialogUtils.getSizeComparableValue(b.size) -
          ProgressDialogUtils.getSizeComparableValue(a.size));
    });
  }

  sortdescending() {
    setState(() {
      starredFiles.sort((a, b) => (b.name ?? '').compareTo(a.name ?? ''));
    });
  }

  sortByDatedescending() {
    setState(() {
      starredFiles.sort((a, b) =>
          (b.updatedAt ?? DateTime(0)).compareTo(a.updatedAt ?? DateTime(0)));
    });
  }

  sortBySizedescending() {
    setState(() {
      starredFiles.sort((a, b) =>
          ProgressDialogUtils.getSizeComparableValue(a.size) -
          ProgressDialogUtils.getSizeComparableValue(b.size));
    });
  }

  listGrid() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      key: _globalKey,
      endDrawer: Drawer(
        elevation: 10,
        child: NavigationPageScreen(),
      ),
      body: SizedBox(
        width: mediaQueryData.size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 3.v),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: CustomSearchView(
                  // controller: controller.searchController,
                  hintText: "msg_search_files_in".tr,
                ),
              ),
              SizedBox(height: 40.v),
              CustomRecentFile(
                  "lbl_starred_files".tr,
                  sortAscending,
                  sortdescending,
                  listGrid,
                  isGridView,
                  sortBySizeAscending,
                  sortBySizedescending,
                  sortByDatedescending),
              SizedBox(height: 13.v),
              isLoading == true
                  ? const SizedBox(
                      child: Center(
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue,
                            // Colors.white,
                          ),
                        ),
                      ),
                    )
                  : isGridView == true
                      ? GroupedListView.list(
                          items: starredFiles,
                          physics: const ScrollPhysics(),
                          headerBuilder: (context, DateTime index) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 30.h, bottom: 10.h),
                                child: Text(
                                  ProgressDialogUtils.formatDateTime(index),
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                            );
                          },
                          listItemBuilder: (context, int count, int itemIndex,
                              UserfilesItemModel item, int index) {
                            item = starredFiles[itemIndex];
                            return CustomListView(
                              item: item,
                              reloadResource: recentFilesCallBack,
                            );
                          },
                          itemGrouper: ((item) => DateTime(item.updatedAt!.year,
                              item.updatedAt!.month, item.updatedAt!.day)))
                      : GroupedListView.grid(
                          items: starredFiles,
                          physics: const NeverScrollableScrollPhysics(),
                          headerBuilder: (context, DateTime index) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 30.h, bottom: 10.h),
                                child: Text(
                                  ProgressDialogUtils.formatDateTime(index),
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                            );
                          },
                          gridItemBuilder: (context, int count, int itemIndex,
                              UserfilesItemModel item, int index) {
                            item = starredFiles[itemIndex];
                            return CustomGridView(
                              item: item,
                              reloadResource: recentFilesCallBack,
                            );
                          },
                          crossAxisCount: 2,
                          itemGrouper: ((item) {
                            return DateTime(item.updatedAt!.year,
                                item.updatedAt!.month, item.updatedAt!.day);
                          }),
                        )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 30.h),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "lbl_safe".tr,
                style: CustomTextStyles.titleLargeSofiaProIndigo900,
              ),
              TextSpan(
                text: "lbl_box".tr,
                style: CustomTextStyles.headlineMedium_1,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            _globalKey.currentState!.openEndDrawer();
          },
          child: AppbarTrailingImage(
            imagePath: ImageConstant.imgCiHamburger,
            margin: EdgeInsets.fromLTRB(26.h, 14.v, 26.h, 11.v),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildStarredFiles() {
    return Padding(
      padding: EdgeInsets.only(
        left: 30.h,
        right: 22.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 5.v,
              bottom: 8.v,
            ),
            child: Text(
              "lbl_starred_files".tr,
              style: theme.textTheme.titleMedium,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgGroup109,
            height: 10.v,
            width: 12.h,
            margin: EdgeInsets.only(
              left: 6.h,
              top: 10.v,
              bottom: 10.v,
            ),
          ),
          const Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgComponent4Onprimary,
            height: 30.adaptSize,
            width: 30.adaptSize,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCarbonFolder() {
    return Padding(
      padding: EdgeInsets.only(
        left: 28.h,
        right: 25.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgCarbonFolderBlue20036x36,
            height: 36.adaptSize,
            width: 36.adaptSize,
            margin: EdgeInsets.only(bottom: 2.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 6.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_my_designs".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 2.v),
                SizedBox(
                  width: 93.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text(
                          "lbl_0_0kb".tr,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Text(
                        "lbl_1_sec_ago".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgInfo,
            height: 31.v,
            width: 22.h,
            margin: EdgeInsets.only(bottom: 6.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPdf() {
    return Padding(
      padding: EdgeInsets.only(
        left: 31.h,
        right: 25.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 6.v,
              bottom: 4.v,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 5.h,
              vertical: 4.v,
            ),
            decoration: AppDecoration.fillRed.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "lbl_pdf".tr,
                  style: theme.textTheme.labelSmall,
                ),
                Container(
                  height: 2.v,
                  width: 21.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(
                      1.h,
                    ),
                  ),
                ),
                SizedBox(height: 2.v),
                Container(
                  height: 2.v,
                  width: 21.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(
                      1.h,
                    ),
                  ),
                ),
                SizedBox(height: 2.v),
                Container(
                  height: 2.v,
                  width: 21.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(
                      1.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 5.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_statement_pdf".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 2.v),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Text(
                        "lbl_2_1kb".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text(
                        "lbl_5_30_pm".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgInfo,
            height: 31.v,
            width: 22.h,
            margin: EdgeInsets.only(bottom: 6.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWorkspacePng() {
    return Padding(
      padding: EdgeInsets.only(
        left: 28.h,
        right: 25.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgCarbonFolder36x36,
            height: 36.adaptSize,
            width: 36.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 5.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_workspace_png".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 2.v),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Text(
                        "lbl_48_1kb".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text(
                        "lbl_2_10_pm".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgInfo,
            height: 31.v,
            width: 22.h,
            margin: EdgeInsets.only(bottom: 6.v),
          ),
        ],
      ),
    );
  }
}
