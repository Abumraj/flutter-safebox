import 'package:flutter/material.dart';
import 'package:safebox/controller/starred_folder_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/presentation/account_screen.dart';
import 'package:safebox/presentation/add_upload_page_bottomsheet.dart';
import 'package:safebox/presentation/added_folder_one_page.dart';
import 'package:safebox/presentation/starred_files_page.dart';
import 'package:safebox/presentation/starred_folder_page.dart';

// ignore_for_file: must_be_immutable
class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  // final HomePageController homePageController = Get.put(HomePageController());
  StarredFolderController controller = Get.put(StarredFolderController());
  int currentTab = 0;
  List<Widget> screens = [
    const StarredFolderPage(),
    const AddedFolderOnePage(),
    StarredFilesPage(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final PageStorageBucket bucket = PageStorageBucket();
    Widget currentPage = screens[currentTab];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: _buildAppBar(),
      body: PageStorage(bucket: bucket, child: currentPage),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(AddUploadPageBottomsheet());
        },
        backgroundColor: appTheme.blue800,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80.adaptSize,
        // color: Colors.white,
        elevation: 8,
        surfaceTintColor: Colors.grey,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentPage = const StarredFolderPage();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgNavHome,
                            height: 22.adaptSize,
                            width: 22.adaptSize,
                            color: currentTab == 0
                                ? appTheme.blue800
                                : appTheme.gray40001,
                          ),
                          Text(
                            "Home",
                            style: currentTab == 0
                                ? CustomTextStyles
                                    .labelLargeSofiaProBlue800Medium
                                    .copyWith(
                                    color: appTheme.blue800,
                                  )
                                : CustomTextStyles.labelLargeSofiaProGray40001
                                    .copyWith(
                                    color: appTheme.gray40001,
                                  ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = currentTab = 1;
                          currentPage = AddedFolderOnePage();
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgNavFiles,
                            height: 22.adaptSize,
                            width: 22.adaptSize,
                            color: currentTab == 1
                                ? appTheme.blue800
                                : appTheme.gray40001,
                          ),
                          Text(
                            "files",
                            style: currentTab == 1
                                ? CustomTextStyles
                                    .labelLargeSofiaProBlue800Medium
                                    .copyWith(
                                    color: appTheme.blue800,
                                  )
                                : CustomTextStyles.labelLargeSofiaProGray40001
                                    .copyWith(
                                    color: appTheme.gray40001,
                                  ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentPage = StarredFilesPage();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgNavStarred,
                            height: 22.adaptSize,
                            width: 22.adaptSize,
                            color: currentTab == 2
                                ? appTheme.blue800
                                : appTheme.gray40001,
                          ),
                          Text(
                            "Starred",
                            style: currentTab == 2
                                ? CustomTextStyles
                                    .labelLargeSofiaProBlue800Medium
                                    .copyWith(
                                    color: appTheme.blue800,
                                  )
                                : CustomTextStyles.labelLargeSofiaProGray40001
                                    .copyWith(
                                    color: appTheme.gray40001,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentPage = AccountScreen();
                          currentTab = 3;
                          // print(currentTab);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgNavAccount,
                            height: 22.adaptSize,
                            width: 22.adaptSize,
                            color: currentTab == 3
                                ? appTheme.blue800
                                : appTheme.gray40001,
                          ),
                          Text(
                            "Account",
                            style: currentTab == 3
                                ? CustomTextStyles
                                    .labelLargeSofiaProBlue800Medium
                                    .copyWith(
                                    color: appTheme.blue800,
                                  )
                                : CustomTextStyles.labelLargeSofiaProGray40001
                                    .copyWith(
                                    color: appTheme.gray40001,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
