import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/material.dart';
import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/controller/starred_folder_controller.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/userfiles_item_model.dart';
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
  const StarredFolderPage({Key? key})
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

  ScrollController _scrollController = new ScrollController();
  bool isGridView = false;
  List<UserfilesItemModel> recentFiles = [];
  bool isLoading = false;
  TaskRecord? trackRecord;

  @override
  void initState() {
    recentFilesCall();
    trckUploadProgress();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

   trckUploadProgress()async{
    final record = await FileDownloader().database.recordForId(Uploadanager.backupTask.taskId);
     if (record!.status == TaskStatus.running) {
      trackRecord = record;
    print('-- progress ${record.progress * 100}%');
    print('-- file size ${record.expectedFileSize} bytes');
  }
   }

  void recentFilesCall() {
    setState(() {
      isLoading = true;
    });
      accountController.refreshProfile();
    _apiRepositoryImplementation.getRecentFiles().then((value) {
      List<UserfilesItemModel> list = parsedFileList(value.data['data']);
      setState(() {
        recentFiles = list; // Assign the new list directly
        isLoading = false;
        print(recentFiles.length); // Assign the new list directly
      });
    });
  }

  void recentFilesCallBack() {
    _apiRepositoryImplementation.getRecentFiles().then((value) {
      List<UserfilesItemModel> list = parsedFileList(value.data['data']);
      setState(() {
        recentFiles = list;
      });
    });
  }

  static List<UserfilesItemModel> parsedFileList(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed
        .map<UserfilesItemModel>((json) => UserfilesItemModel.fromJson(json))
        .toList();
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
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: CustomSearchView(
                    // controller: controller.searchController,
                    hintText: "msg_search_files_in".tr,
                  ),
                ),
                Obx((){
                return  uploadController.progressUpdate.value != 0.0 ?
                 BackupProgressindicator(controller: uploadController,):const SizedBox();
                }),
                SizedBox(height: 38.v),
                CustomRecentFile(
                    'Recent Files',
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
                    : 
                    
                  Obx(() {
                  return    controller.isGridView.value == true
                        ? GroupedListView.list(
                            items: recentFiles,
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
                              item = recentFiles[itemIndex];
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
                            items: recentFiles,
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
                              item = recentFiles[itemIndex];
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
                          );

                  })
                // SizedBox(height: 521.v),
              ],
            ),
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
