import 'package:flutter/material.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/transaction_model.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/transaction_widget.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _ReferralsState();
}

class _ReferralsState extends State<Transactions> {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  List<TransactionModel> recentFiles = [];
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
    _apiRepositoryImplementation.getTransactionHistory().then((value) {
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
      appBar: _buildAppBar(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : recentFiles.isNotEmpty
              ? SingleChildScrollView(child: _buildUserProfile())
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: 62.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup9,
                        height: 160.v,
                        width: 171.h,
                      ),
                      Text(
                        " No Transaction Found".tr,
                        style: CustomTextStyles.bodyMediumBlack90001,
                      ),
                      // SizedBox(height: 211.v),
                      // SizedBox(height: 30.v),
                    ],
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
        itemCount: recentFiles.length,
        itemBuilder: (context, index) {
          TransactionModel model = recentFiles[index];
          return TransactionTile(model);
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
        text: "Transaction History".tr,
        margin: EdgeInsets.only(left: 10.h),
      ),
    );
  }

  onTapArrowLeft() {
    Get.back();
  }
}
