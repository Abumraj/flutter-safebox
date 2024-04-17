import 'package:flutter/material.dart';
import 'package:safebox/controller/added_folder_one_controller.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/added_folder_one_model.dart';
import 'package:safebox/models/fileinfo_item_model.dart';
import 'package:safebox/models/filescolumn_item_model.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/presentation/navigation_page_screen.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/backup_progress_indicator.dart';
import 'package:safebox/widgets/custom_grid_view.dart';
import 'package:safebox/widgets/custom_list_view.dart';
import 'package:safebox/widgets/custom_recent_files.dart';
import 'package:safebox/widgets/custom_search_view.dart';
import 'package:safebox/widgets/fileinfo_item_widget.dart';
import 'package:safebox/widgets/filescolumn_item_widget.dart';
import 'package:simple_grouped_listview/simple_grouped_listview.dart';

// ignore: must_be_immutable
class AddedFolderOnePage extends StatefulWidget {
  const AddedFolderOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<AddedFolderOnePage> createState() => _AddedFolderOnePageState();
}

class _AddedFolderOnePageState extends State<AddedFolderOnePage> {
  AddedFolderOneController controller =
      Get.put(AddedFolderOneController(AddedFolderOneModel().obs));

  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = new ScrollController();
  final TextEditingController _searchController = TextEditingController();
  List<UserfilesItemModel> searchResult = [];
  final Uploadanager uploadController = Get.put(Uploadanager());

  bool isGridView = false;
  List<UserfilesItemModel> allFiles = [];
  bool isLoading = false;
  int page = 1;
  bool hasMore = false;
  @override
  void initState() {
    recentFilesCall();
    // controller.addedFolderOneModelObj.value.
    super.initState();
    _scrollController.addListener(_onScroll);
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
        print(hasMore);
        // print(allFiles.length); // Assign the new list directly
      });
    });
  }

  Future<void> _loadMoreItems() async {
    if (!isLoading && hasMore) {
      // setState(() {
      //   isLoading = true;
      // });
      _apiRepositoryImplementation.getAllFiles(page + 1).then((value) {
        setState(() {
          allFiles.addAll(value.items);
          hasMore = value.hasMoreItems;
          page = value.currentPage;
          // isLoading = false;
        });
      });
      // Load more items
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      print("loadmore");
      _loadMoreItems();
    }
  }

  void recentFilesCallBack() {
    // ProgressDialogUtils.showProgressDialog();
    _apiRepositoryImplementation.getAllFiles(1).then((value) {
      setState(() {
        allFiles = value.items;
        hasMore = value.hasMoreItems;
        page = value.currentPage;
      });
    });
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

  sortAscending() {
    setState(() {
      // sorter = 1;
      allFiles.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
    });
  }

  sortBySizeAscending() {
    setState(() {
      allFiles.sort((a, b) =>
          ProgressDialogUtils.getSizeComparableValue(b.size) -
          ProgressDialogUtils.getSizeComparableValue(a.size));
    });
  }

  sortdescending() {
    setState(() {
      allFiles.sort((a, b) => (b.name ?? '').compareTo(a.name ?? ''));
    });
  }

  sortByDatedescending() {
    setState(() {
      allFiles.sort((a, b) =>
          (b.updatedAt ?? DateTime(0)).compareTo(a.updatedAt ?? DateTime(0)));
    });
  }

  sortBySizedescending() {
    setState(() {
      allFiles.sort((a, b) =>
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _globalKey,
        endDrawer: Drawer(
          // width: MediaQuery.of(context).size.width - 20,
          // height: MediaQuery.of(context).size.width,
          elevation: 10,
          child: NavigationPageScreen(),
        ),
        appBar: _buildAppBar(),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.only(top: 3.v),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: CustomSearchView(
                    controller: _searchController,
                    hintText: "msg_search_files_in".tr,
                    onChanged: (value) {
                      setState(() {
                        searchResult = allFiles
                            .where((element) => element.name!
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                        if (value.isEmpty) {
                          searchResult = [];
                        }
                      });
                    },
                  ),
                ),
                Obx(() {
                  return uploadController.progressUpdate.value != 0.0 ||
                          uploadController.isPreparingBackUp.value != false
                      ? BackupProgressindicator(
                          controller: uploadController,
                        )
                      : const SizedBox();
                }),
                SizedBox(height: 30.v),
                _buildFilesColumn(),
                SizedBox(height: 33.v),
                CustomRecentFile(
                    "lbl_all_files".tr,
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
                    : searchResult.isEmpty && _searchController.text.isNotEmpty
                        ? SizedBox(
                            width: 220.h,
                            child: Text("No Result Found",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles
                                    .titleLargeOpenSansGray40001))
                        : searchResult.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: searchResult.length,
                                itemBuilder: (BuildContext context, int index) {
                                  UserfilesItemModel item = searchResult[index];

                                  return CustomListView(
                                      item: item,
                                      reloadResource: recentFilesCallBack);
                                })
                            : allFiles.isEmpty
                                ? SizedBox(
                                    width: 220.h,
                                    child: Text("msg_you_have_no_files".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: CustomTextStyles
                                            .titleLargeOpenSansGray40001))
                                : isGridView == true
                                    ? GroupedListView.list(
                                        items: allFiles,
                                        // controller: _scrollController,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        headerBuilder:
                                            (context, DateTime index) {
                                          return Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30.h, bottom: 10.h),
                                              child: Text(
                                                ProgressDialogUtils
                                                    .formatDateTime(index),
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                            ),
                                          );
                                        },
                                        listItemBuilder: (context,
                                            int count,
                                            int itemIndex,
                                            UserfilesItemModel item,
                                            int index) {
                                          if (index == allFiles.length - 1 &&
                                              hasMore) {
                                            return _buildLoadingIndicator();
                                          }
                                          return CustomListView(
                                            item: item,
                                            reloadResource: recentFilesCallBack,
                                          );
                                        },
                                        itemGrouper: ((item) => DateTime(
                                            item.updatedAt!.year,
                                            item.updatedAt!.month,
                                            item.updatedAt!.day)))
                                    : GroupedListView.grid(
                                        items: allFiles,
                                        // controller: _scrollController,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        headerBuilder:
                                            (context, DateTime index) {
                                          return Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30.h, bottom: 10.h),
                                              child: Text(
                                                ProgressDialogUtils
                                                    .formatDateTime(index),
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                            ),
                                          );
                                        },
                                        gridItemBuilder: (context,
                                            int count,
                                            int itemIndex,
                                            UserfilesItemModel item,
                                            int index) {
                                          if (index == allFiles.length - 1) {
                                            return _buildLoadingIndicator();
                                          }
                                          return CustomGridView(
                                            item: item,
                                            reloadResource: recentFilesCallBack,
                                          );
                                        },
                                        crossAxisCount: 2,
                                        itemGrouper: ((item) {
                                          return DateTime(
                                              item.updatedAt!.year,
                                              item.updatedAt!.month,
                                              item.updatedAt!.day);
                                        }),
                                      )
              ],
            ),
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
  Widget _buildFilesColumn() {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 100.v,
        child: Obx(
          () => ListView.separated(
            // padding: EdgeInsets.only(left: 30.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return const SizedBox(
                  // width: 7.h,
                  );
            },
            itemCount: controller
                .addedFolderOneModelObj.value.filescolumnItemList.value.length,
            itemBuilder: (context, index) {
              FilescolumnItemModel filesModel = controller
                  .addedFolderOneModelObj
                  .value
                  .filescolumnItemList
                  .value[index];

              return FilescolumnItemWidget(filesModel);
            },
          ),
        ),
      ),
    );
  }

  // /// Section Widget
  // Widget _buildUserFile() {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //       left: 28.h,
  //       right: 25.h,
  //     ),
  //     child: Obx(
  //       () => ListView.separated(
  //         physics: const NeverScrollableScrollPhysics(),
  //         shrinkWrap: true,
  //         separatorBuilder: (
  //           context,
  //           index,
  //         ) {
  //           return SizedBox(
  //             height: 15.v,
  //           );
  //         },
  //         itemCount: controller
  //             .addedFolderOneModelObj.value.userfileItemList.value.length,
  //         itemBuilder: (context, index) {
  //           UserfileItemModel model = controller
  //               .addedFolderOneModelObj.value.userfileItemList.value[index];
  //           return UserfileItemWidget(
  //             model,
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildFileInfo() {
    return Padding(
      padding: EdgeInsets.only(
        left: 31.h,
        right: 25.h,
      ),
      child: Obx(
        () => ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: controller
              .addedFolderOneModelObj.value.fileinfoItemList.value.length,
          itemBuilder: (context, index) {
            FileinfoItemModel model = controller
                .addedFolderOneModelObj.value.fileinfoItemList.value[index];
            return FileinfoItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
