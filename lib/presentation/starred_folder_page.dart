import 'package:flutter/material.dart';
import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/controller/starred_folder_controller.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/presentation/carousel_slider.dart';
import 'package:safebox/presentation/navigation_page_screen.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/backup_progress_indicator.dart';
import 'package:safebox/widgets/custom_grid_view.dart';
import 'package:safebox/widgets/custom_list_view.dart';
import 'package:safebox/widgets/custom_recent_files.dart';
import 'package:safebox/widgets/custom_search_view.dart';
import 'package:simple_grouped_listview/simple_grouped_listview.dart';

class StarredFolderPage extends StatefulWidget {
  final bool? isFirstLogin;
  const StarredFolderPage({Key? key, this.isFirstLogin})
      : super(
          key: key,
        );

  @override
  State<StarredFolderPage> createState() => _StarredFolderPageState();
}

class _StarredFolderPageState extends State<StarredFolderPage> {
  StarredFolderController controller = Get.put(StarredFolderController());
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  final AccountController accountController = Get.put(AccountController());

  final Uploadanager uploadController = Get.put(Uploadanager());

  final ScrollController _scrollController = ScrollController();
  bool isGridView = false;
  List<UserfilesItemModel> recentFiles = [];
  final TextEditingController _searchController = TextEditingController();
  List<UserfilesItemModel> searchResult = [];
  bool isLoading = false;
  int page = 1;
  bool hasMore = false;
  @override
  void initState() {
    // widget.isFirstLogin != null
    //     ?

    recentFilesCall();
    super.initState();
    // recentFilesCall();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void recentFilesCall() async {
    setState(() {
      isLoading = true;
    });
    await _apiRepositoryImplementation.getAllFiles(page).then((value) {
      setState(() {
        recentFiles = value.items;
        hasMore = value.hasMoreItems;
        page = value.currentPage; // Assign the new list directly
        isLoading = false;
        // print(hasMore);
        uploadController.upgradePopUp();
        // print(allFiles.length); // Assign the new list directly
      });
    });
  }

  void recentFilesCallBack() {
    _apiRepositoryImplementation.getRecentFiles().then((value) {
      setState(() {
        recentFiles = value.items;
        hasMore = value.hasMoreItems;
        page = value.currentPage; // Assign the new list directly
        isLoading = false;
        // print(hasMore);
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
      // print("loadmore");
      _loadMoreItems();
    }
  }

  sortAscending() {
    setState(() {
      recentFiles.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
    });
  }

  sortBySizeAscending() {
    setState(() {
      recentFiles.sort((a, b) =>
          ProgressDialogUtils.getSizeComparableValue(b.size) -
          ProgressDialogUtils.getSizeComparableValue(a.size));
    });
  }

  sortdescending() {
    setState(() {
      recentFiles.sort((a, b) => (b.name ?? '').compareTo(a.name ?? ''));
    });
  }

  sortByDatedescending() {
    setState(() {
      recentFiles.sort((a, b) =>
          (b.updatedAt ?? DateTime(0)).compareTo(a.updatedAt ?? DateTime(0)));
    });
  }

  sortBySizedescending() {
    setState(() {
      recentFiles.sort((a, b) =>
          ProgressDialogUtils.getSizeComparableValue(a.size) -
          ProgressDialogUtils.getSizeComparableValue(b.size));
    });
  }

  listGrid() {
    setState(() {
      isGridView = !isGridView;
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
          height: mediaQueryData.size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 1,
                  ),
                  // Container(
                  //   // padding: const EdgeInsets.only(left: 20, right: 20),
                  //   width: MediaQuery.of(context).size.width - 30.h,
                  //   decoration: AppDecoration.fillOrange.copyWith(
                  //     borderRadius: BorderRadiusStyle.roundedBorder30,
                  //   ),
                  //   height: 20.h,
                  //   child: Center(
                  //     child: Marquee(
                  //       text:
                  //           'This is where the notification will show up. Kindly provide the intended text to place here',
                  //       style: CustomTextStyles.bodySmallBlue800,
                  //       scrollAxis: Axis.horizontal,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       blankSpace: 20.0,
                  //       velocity: 100.0,
                  //       pauseAfterRound: const Duration(seconds: 1),
                  //       startPadding: 10.0,
                  //       accelerationDuration: const Duration(seconds: 1),
                  //       accelerationCurve: Curves.linear,
                  //       decelerationDuration: const Duration(milliseconds: 500),
                  //       decelerationCurve: Curves.easeOut,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.h),
                    child: CustomSearchView(
                      controller: _searchController,
                      hintText: "msg_search_files_in".tr,
                      // hintStyle: ,
                      onChanged: (p0) {
                        setState(() {
                          searchResult = recentFiles
                              .where((element) => element.name!
                                  .toLowerCase()
                                  .contains(p0.toLowerCase()))
                              .toList();
                          if (p0.isEmpty) {
                            searchResult = [];
                          }
                        });
                      },
                    ),
                  ),
                  // Imageslide(),
                  Obx(() {
                    return uploadController.progressUpdate.value != 0.0 ||
                            uploadController.isPreparingBackUp.value != false
                        ? BackupProgressindicator(
                            controller: uploadController,
                          )
                        : const SizedBox();
                  }),
                  SizedBox(height: 32.v),
                  CustomRecentFile(
                      'All Files',
                      // controller.starredFolderModelObj,
                      sortAscending,
                      sortdescending,
                      controller.listGrid,
                      isGridView,
                      sortBySizeAscending,
                      sortBySizedescending,
                      sortByDatedescending),
                  SizedBox(height: 15.v),
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
                      : searchResult.isEmpty &&
                              _searchController.text.isNotEmpty
                          ? Expanded(
                              child: Center(
                                child: Text("No Result Found",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles
                                        .titleLargeOpenSansGray40001),
                              ),
                            )
                          : searchResult.isNotEmpty
                              ? ListView.builder(
                                  controller: _scrollController,
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: searchResult.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    UserfilesItemModel item =
                                        searchResult[index];

                                    return CustomListView(
                                        item: item,
                                        reloadResource: recentFilesCallBack);
                                  })
                              : recentFiles.isEmpty
                                  ? Center(
                                      child: SizedBox(
                                          width: 220.h,
                                          child: Text(
                                              "msg_you_have_no_files".tr,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: CustomTextStyles
                                                  .titleLargeOpenSansGray40001)),
                                    )
                                  : Obx(() {
                                      return controller.isGridView.value == true
                                          ? Expanded(
                                              child: SingleChildScrollView(
                                                controller: _scrollController,
                                                child: GroupedListView.list(
                                                  // controller: _scrollController,
                                                  items: recentFiles,
                                                  physics:
                                                      const ScrollPhysics(),
                                                  headerBuilder: (context,
                                                      DateTime index) {
                                                    return Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 30.h,
                                                                bottom: 10.h),
                                                        child: Text(
                                                          ProgressDialogUtils
                                                              .formatDateTime(
                                                                  index),
                                                          style: theme.textTheme
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  listItemBuilder: (context,
                                                      count,
                                                      itemIndex,
                                                      item,
                                                      index) {
                                                    if (index ==
                                                            recentFiles.length -
                                                                1 &&
                                                        hasMore) {
                                                      return _buildLoadingIndicator();
                                                    }
                                                    return CustomListView(
                                                      item: item,
                                                      reloadResource:
                                                          recentFilesCallBack,
                                                    );
                                                  },
                                                  // Group items by year, month, and day of `updatedAt`
                                                  itemGrouper: (item) =>
                                                      DateTime(
                                                    item.updatedAt!.year,
                                                    item.updatedAt!.month,
                                                    item.updatedAt!.day,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Expanded(
                                              child: SingleChildScrollView(
                                                controller: _scrollController,
                                                child: GroupedListView.grid(
                                                  // controller: _scrollController,
                                                  items: recentFiles,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  headerBuilder: (context,
                                                      DateTime index) {
                                                    return Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 30.h,
                                                                bottom: 10.h),
                                                        child: Text(
                                                          ProgressDialogUtils
                                                              .formatDateTime(
                                                                  index),
                                                          style: theme.textTheme
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  gridItemBuilder: (context,
                                                      int count,
                                                      int itemIndex,
                                                      UserfilesItemModel item,
                                                      int index) {
                                                    if (index ==
                                                            recentFiles.length -
                                                                1 &&
                                                        hasMore) {
                                                      return _buildLoadingIndicator();
                                                    }
                                                    return CustomGridView(
                                                      item: item,
                                                      reloadResource:
                                                          recentFilesCallBack,
                                                    );
                                                  },
                                                  crossAxisCount: 2,
                                                  itemGrouper: ((item) {
                                                    return DateTime(
                                                        item.updatedAt!.year,
                                                        item.updatedAt!.month,
                                                        item.updatedAt!.day);
                                                  }),
                                                ),
                                              ),
                                            );
                                    }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, right: 10.0, left: 10.0),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Imageslide(),
                ),
              )
            ],
          )),
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
}
