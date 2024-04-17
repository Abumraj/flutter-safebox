import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/presentation/home_page_screen.dart';
import 'package:safebox/presentation/login_screen.dart';
import 'package:safebox/presentation/welcome.dart';

class SplashScreen extends StatefulWidget {
  final String? isLogin;
  const SplashScreen({Key? key, this.isLogin}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final UserProfileManager userProfileManager = Get.find();
  final Uploadanager uploadController = Get.put(Uploadanager());
  bool dbChanged = false;
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() async {
    // print(widget.isLogin);
    if (widget.isLogin == "true") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePageScreen()));
    } else if (widget.isLogin == "false") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      Get.off(const Welcome());
    }
    uploadController.cacheContacts(dbChanged);
  }

  @override
  void initState() {
    super.initState();
    FlutterContacts.addListener(() {
      // dbChanged = true;
      uploadController.cacheContacts(true);
    });
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 1.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgFlag,
                  height: 43.v,
                  width: 35.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 9.h,
                    top: 5.v,
                    bottom: 4.v,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_safe".tr,
                          style: theme.textTheme.headlineMedium,
                        ),
                        TextSpan(
                          text: "lbl_box".tr,
                          style: theme.textTheme.displaySmall,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
