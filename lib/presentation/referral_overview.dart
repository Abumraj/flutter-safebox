import 'package:flutter/material.dart';
import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/referred_user_model.dart';
import 'package:safebox/presentation/referrals.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/referred_user_widget.dart';

class ReferralOverview extends StatefulWidget {
  const ReferralOverview({super.key});

  @override
  State<ReferralOverview> createState() => _ReferralOverviewState();
}

class _ReferralOverviewState extends State<ReferralOverview> {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  final AccountController accountController = Get.put(AccountController());
  List<ReeferredUserModel> recentFiles = [];
  bool isLoading = false;

  @override
  void initState() {
    recentFilesCall();
    super.initState();
  }

  void recentFilesCall() {
    setState(() {
      isLoading = true;
    });
    // accountController.refreshProfile();
    _apiRepositoryImplementation.getReferredUsers().then((value) {
      setState(() {
        recentFiles = value; // Assign the new list directly
        isLoading = false;
        print(recentFiles.length); // Assign the new list directly
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 7.v),
        child: Column(
          children: [
            _buildUserProfileFrame(),
            SizedBox(height: 30.v),
            if (recentFiles.isNotEmpty) _buildViewAllFrame(),
            SizedBox(height: 25.v),
            isLoading
                ? CircularProgressIndicator()
                : recentFiles.isNotEmpty
                    ? _buildUserProfile()
                    :
                    // SizedBox(height: 211.v),
                    SizedBox(height: 30.v),
            if (recentFiles.isEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40.h),
                  child: Text(
                    "How to Refer".tr,
                    style: CustomTextStyles.titleSmallOnPrimaryContainer,
                  ),
                ),
              ),
            if (recentFiles.isEmpty) SizedBox(height: 9.v),
            if (recentFiles.isEmpty)
              Container(
                width: 294.h,
                margin: EdgeInsets.symmetric(horizontal: 40.h),
                child: Text(
                  "Lorem ipsumis a commonly used placeholder text in the design and typesetting industry",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodySmallBlue800,
                ),
              ),
            if (recentFiles.isEmpty) SizedBox(height: 44.v),
            if (recentFiles.isEmpty)
              CustomImageView(
                imagePath: ImageConstant.imgGroup9,
                height: 160.v,
                width: 171.h,
              ),
            if (recentFiles.isEmpty) SizedBox(height: 16.v),
            if (recentFiles.isEmpty)
              Text(
                "You have not referred any user".tr,
                style: CustomTextStyles.bodyMediumBlack90001,
              ),
            SizedBox(height: 185.v),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildViewAllFrame() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Referred Users".tr,
            style: CustomTextStyles.titleSmallGray900,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Get.to(Referrals(recentFiles: recentFiles));
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 3.v),
              child: Text(
                "View all".tr,
                style: CustomTextStyles.bodySmallBlue20012,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.only(
              left: 4.h,
              bottom: 5.v,
            ),
          ),
        ],
      ),
    );
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
        text: "Referrals".tr,
        margin: EdgeInsets.only(left: 10.h),
      ),
    );
  }

  Widget _buildUserProfileFrame() {
    return Container(
      padding: EdgeInsets.only(
        top: 30.h,
        bottom: 22.v,
        left: 22.h,
        right: 22.h,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You've Earned".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    "₦${accountController.accountModelObj.value.earnings}".tr,
                    style: theme.textTheme.headlineMedium,
                  ),
                ],
              ),
              _buildWithdrawButton(),
            ],
          ),
          SizedBox(height: 21.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgIconParkOutli,
                height: 20.adaptSize,
                width: 20.adaptSize,
                margin: EdgeInsets.only(bottom: 1.v),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "View Transactions".tr,
                    style: CustomTextStyles.bodyMediumBlue200,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWithdrawButton() {
    return CustomElevatedButton(
      height: 40.v,
      width: 96.h,
      text: "Withdraw".tr,
      margin: EdgeInsets.only(
        top: 12.v,
        bottom: 15.v,
      ),
      buttonStyle: CustomButtonStyles.outlinePrimary,
      buttonTextStyle: CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold,
    );
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 18.v,
          );
        },
        itemCount: recentFiles.length < 5 ? recentFiles.length : 5,
        itemBuilder: (context, index) {
          ReeferredUserModel model = recentFiles[index];
          return ReferredUserTile(model);
        },
      ),
    );
  }

  onTapArrowLeft() {
    Get.back();
  }
}
