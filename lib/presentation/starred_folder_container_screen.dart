import 'package:safebox/controller/starred_folder_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/presentation/added_folder_one_page.dart';
import 'package:safebox/presentation/starred_files_page.dart';
import 'package:safebox/presentation/starred_folder_page.dart';
import 'package:safebox/widgets/custom_bottom_app_bar.dart';

class StarredFolderContainerScreen
    extends GetWidget<StarredFolderContainerController> {
  const StarredFolderContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.starredFolderPage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar: _buildBottomAppBar(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked));
  }

  /// Section Widget
  Widget _buildBottomAppBar() {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.starredFolderPage;
      case BottomBarEnum.Files:
        return AppRoutes.addedFolderOnePage;
      case BottomBarEnum.Starred:
        return AppRoutes.starredFilesPage;
      case BottomBarEnum.Account:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.starredFolderPage:
        return StarredFolderPage();
      case AppRoutes.addedFolderOnePage:
        return AddedFolderOnePage();
      case AppRoutes.starredFilesPage:
        return StarredFilesPage();
      default:
        return DefaultWidget();
    }
  }
}
