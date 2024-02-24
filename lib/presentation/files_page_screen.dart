import 'package:flutter/material.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/presentation/contact_selection_page.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_floating_button.dart';
import 'package:safebox/widgets/custom_list_view.dart';
import 'package:safebox/widgets/custom_search_view.dart';
import 'package:simple_grouped_listview/simple_grouped_listview.dart';

class FilesPageScreen extends StatefulWidget {
  final String title;
  const FilesPageScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<FilesPageScreen> createState() => _FilesPageScreenState();
}

class _FilesPageScreenState extends State<FilesPageScreen> {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  final Uploadanager uploadController = Get.put(Uploadanager());

  List<UserfilesItemModel> recentFiles = [];
  bool isLoading = false;
  @override
  void initState() {
    recentFilesCall();
    super.initState();
  }

  void recentFilesCall() {
    recentFiles = [];
    setState(() {
      isLoading = true;
    });
    _apiRepositoryImplementation.getFilesByType(widget.title).then((value) {
      // List<UserfilesItemModel> list = parsedFileList(value.data['data']);
      setState(() {
        recentFiles = value; // Assign the new list directly
        isLoading = false;
        print(recentFiles.length); // Assign the new list directly
      });
    });
  }

  // static List<UserfilesItemModel> parsedFileList(dynamic responseBody) {
  //   final parsed = responseBody.cast<Map<String, dynamic>>();
  //   return parsed
  //       .map<UserfilesItemModel>((json) => UserfilesItemModel.fromJson(json))
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 2.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.h),
                      child: CustomSearchView(
                          // controller: controller.searchController,
                          hintText: "lbl_search_files".tr)),
                  SizedBox(height: 39.v),
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
                                    child: Text(
                                        "You have no ${widget.title} here yet.",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: CustomTextStyles
                                            .titleLargeOpenSansGray40001)),
                              ]))
                          : GroupedListView.list(
                              items: recentFiles,
                              physics: const ScrollPhysics(),
                              headerBuilder: (context, DateTime index) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 30.h, bottom: 10.h),
                                    child: Text(
                                      ProgressDialogUtils.formatDateTime(index),
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ),
                                );
                              },
                              listItemBuilder: (context,
                                  int count,
                                  int itemIndex,
                                  UserfilesItemModel item,
                                  int index) {
                                item = recentFiles[itemIndex];
                                return CustomListView(
                                  item: item,
                                  reloadResource: recentFilesCall,
                                );
                              },
                              itemGrouper: ((item) => DateTime(
                                  item.updatedAt!.year,
                                  item.updatedAt!.month,
                                  item.updatedAt!.day)))

                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Padding(
                  //         padding: EdgeInsets.only(left: 31.h),
                  //         child: Text("msg_thur_24_mar_2022".tr,
                  //             style: theme.textTheme.bodyMedium))),
                  // SizedBox(height: 18.v),
                  // // _buildUserFiles(),
                ]))),
        floatingActionButton: _buildFloatingActionButton());
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 13.v, bottom: 12.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarTitle(
            text: widget.title, margin: EdgeInsets.only(left: 10.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.fromLTRB(30.h, 13.v, 30.h, 12.v))
        ]);
  }

  // /// Section Widget
  // Widget _buildUserFiles() {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 31.h, right: 25.h),
  //       child: Obx(() => ListView.separated(
  //           physics: NeverScrollableScrollPhysics(),
  //           shrinkWrap: true,
  //           separatorBuilder: (context, index) {
  //             return SizedBox(height: 17.v);
  //           },
  //           itemCount: controller
  //               .filesPageModelObj.value.userfilesItemList.value.length,
  //           itemBuilder: (context, index) {
  //             UserfilesItemModel model = controller
  //                 .filesPageModelObj.value.userfilesItemList.value[index];
  //             return UserfilesItemWidget(model);
  //           })));
  // }

  /// Section Widget
  Widget _buildFloatingActionButton() {
    return CustomFloatingButton(
        onTap: () {
          if (widget.title == "Files") {
            uploadController.docsUpload(callBack: recentFilesCall);
          } else if (widget.title == "Photos") {
            uploadController.photoUpload(callBack: recentFilesCall);
          } else if (widget.title == "Videos") {
            uploadController.videoUpload(callBack: recentFilesCall);
          } else if (widget.title == "Audios") {
            uploadController.audioUpload(callBack: recentFilesCall);
          } else if (widget.title == "Contacts") {
            Get.to(const CustomContactSelectionScreen());
          } else if (widget.title == "Whatsapp") {
            uploadController.whatsappUpload(callBack: recentFilesCall);
          }
        },
        height: 64,
        width: 64,
        backgroundColor: appTheme.blue800,
        child: CustomImageView(
            imagePath: ImageConstant.imgAntDesignPlusOutlined,
            height: 32.0.v,
            width: 32.0.h));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
