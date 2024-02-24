import 'package:safebox/controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          onboardingText: "Starred folder - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.starredFolderContainerScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "onboarding screen One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboardingScreenOneScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "onboarding screen Two".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboardingScreenTwoScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "onboarding screen Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboardingScreenThreeScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "splash screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Create account".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.createAccountScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "login screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Verify email".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.verifyEmailScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Getting started".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.gettingStartedScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Home page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.homePageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Added folder".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.addedFolderScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Starred folder - display message".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.starredFolderDisplayMessageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText:
                              "Unstarred folder page - display message".tr,
                          onTapScreenTitle: () => onTapScreenTitle(AppRoutes
                              .unstarredFolderPageDisplayMessageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "uploading item One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.uploadingItemOneScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "uploading item".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.uploadingItemScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Restore to device".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.restoreToDeviceScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Move page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.movePageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Copy page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.copyPageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Move to my design".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.moveToMyDesignScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Copy to my design".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.copyToMyDesignScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Grid layout".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.gridLayoutScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "files page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.filesPageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "photos page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.photosPageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Whatsapp page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.whatsappPageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Contact page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.contactPageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Navigation page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.navigationPageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Storage page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.storagePageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Storage page One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.storagePageOneScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Data Selection page".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.dataSelectionPageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Settings".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.settingsScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Account".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.accountScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Change Password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.changePasswordScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Upgrade storage".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.upgradeStorageScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "Upgrade storage Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.upgradeStorageThreeScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String onboardingText,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  onboardingText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
