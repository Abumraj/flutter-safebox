import 'package:safebox/controller/onboarding_screen_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
// import 'package:safebox/presentation/login_screen.dart';
// import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class OnboardingScreenTwoScreen
    extends GetWidget<OnboardingScreenTwoController> {
  const OnboardingScreenTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 30.h,
          vertical: 51.v,
        ),
        child: Column(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgGroup101,
              height: 237.v,
              width: 271.h,
            ),
            const Spacer(),
            SizedBox(
              height: 8.v,
              child: AnimatedSmoothIndicator(
                activeIndex: 1,
                count: 3,
                effect: ScrollingDotsEffect(
                  spacing: 10,
                  activeDotColor: appTheme.amberA200,
                  dotColor: appTheme.amber100,
                  dotHeight: 8.v,
                  dotWidth: 8.h,
                ),
              ),
            ),
            SizedBox(height: 32.v),
            Text(
              "msg_safe_guarded_files".tr,
              style: CustomTextStyles.headlineMediumOpenSans,
            ),
            SizedBox(height: 15.v),
            Container(
              width: 263.h,
              margin: EdgeInsets.only(
                left: 32.h,
                right: 18.h,
              ),
              child: Text(
                "msg_all_your_files_are".tr,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyLargeOnPrimaryContainer.copyWith(
                  height: 1.31,
                ),
              ),
            ),
            // SizedBox(height: 83.v),
            // CustomElevatedButton(
            //   height: 50.v,
            //   text: "lbl_get_started".tr,
            //   buttonStyle: CustomButtonStyles.outlinePrimary,
            //   buttonTextStyle:
            //       CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold,
            //   onPressed: () {
            //     Get.off(LoginScreen());
            //   },
            // ),
            // SizedBox(height: 52.v),
          ],
        ),
      ),
    );
  }
}
