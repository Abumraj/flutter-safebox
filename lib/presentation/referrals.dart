import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/referred_user_model.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/referred_user_widget.dart';

class Referrals extends StatefulWidget {
  Referrals({required this.recentFiles, super.key});
  List<ReeferredUserModel> recentFiles;
  @override
  State<Referrals> createState() => _ReferralsState();
}

class _ReferralsState extends State<Referrals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: 24.v), _buildUserProfile()],
        ),
      ),
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
        itemCount: widget.recentFiles.length,
        itemBuilder: (context, index) {
          ReeferredUserModel model = widget.recentFiles[index];
          return ReferredUserTile(model);
        },
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

  onTapArrowLeft() {
    Get.back();
  }
}
