import 'package:safebox/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/profileinformation_item_model.dart';
import 'package:safebox/presentation/home_page_screen.dart';
import 'package:safebox/presentation/login_screen.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/profileinformation_item_widget.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  SettingsScreen({Key? key}) : super(key: key);
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 17.v),
                child: Column(children: [
                  _buildProfileInformation(),
                  SizedBox(height: 220.v),
                  CustomElevatedButton(
                      height: 50.v,
                      text: "lbl_sign_out".tr,
                      margin: EdgeInsets.symmetric(horizontal: 30.h),
                      buttonStyle: CustomButtonStyles.outlinePrimary,
                      onPressed: () {
                        Get.off(LoginScreen());
                      },
                      buttonTextStyle: CustomTextStyles
                          .titleMediumOpenSansWhiteA700SemiBold),
                  SizedBox(height: 60.v),
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarTitle(
            text: "lbl_settings".tr, margin: EdgeInsets.only(left: 10.h)));
  }

  /// Section Widget
  Widget _buildProfileInformation() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Obx(() => ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 5.v);
            },
            itemCount: controller
                .settingsModelObj.value.profileinformationItemList.value.length,
            itemBuilder: (context, index) {
              ProfileinformationItemModel model = controller.settingsModelObj
                  .value.profileinformationItemList.value[index];
              return ProfileinformationItemWidget(model);
            })));
  }

  onTapArrowLeft() {
    Get.off(const HomePageScreen());
  }
}
