import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/presentation/onboarding_screen_one_screen.dart';
import 'package:safebox/presentation/onboarding_screen_three_screen.dart';
import 'package:safebox/presentation/onboarding_screen_two_screen.dart';
// import 'package:safebox/theme/custom_button_style.dart';
// import 'package:safebox/theme/custom_text_style.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';

import 'login_screen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    autoScroll();
  }

  autoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(_currentPage,
          duration: const Duration(seconds: 1), curve: Curves.easeInCirc);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.v),
            Expanded(
              child: PageView(
                reverse: true,
                controller: _controller,
                children: const [
                  OnboardingScreenOneScreen(),
                  OnboardingScreenTwoScreen(),
                  OnboardingScreenThreeScreen(),
                ],
              ),
            ),
            SizedBox(height: 50.v),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.h,
                vertical: 51.v,
              ),
              child: CustomElevatedButton(
                height: 50.v,
                text: "lbl_get_started".tr,
                margin: EdgeInsets.symmetric(horizontal: 2.h),
                buttonStyle: CustomButtonStyles.outlinePrimary,
                buttonTextStyle:
                    CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold,
                onPressed: () {
                  Get.off(LoginScreen());
                },
              ),
            ),
            SizedBox(height: 100.v),
          ],
        ),
      ),
    );
  }
}
