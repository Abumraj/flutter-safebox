import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/image_constant.dart';
import 'package:safebox/presentation/upgrade_storage_one_bottomsheet.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final String authorizedUrl;
  final String reference;
  final String callBackUrl;
  final int subscriptionId;

  const PaymentScreen(
      this.authorizedUrl, this.reference, this.callBackUrl, this.subscriptionId,
      {super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  final WebViewController controller = WebViewController();

  @override
  void initState() {
    loadWebView();
    super.initState();
  }

  loadWebView() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest navigation) {
            if (navigation.url == "https://standard.paystack.co/close") {}
            if (navigation.url ==
                "${widget.callBackUrl}/?trxref=${widget.reference}&reference=${widget.reference}") {
              setState(() {
                _apiRepositoryImplementation
                    .verifyTransaction(widget.reference, widget.subscriptionId)
                    .then((value) {
                  if (value == "Your payment was successful") {
                    Get.bottomSheet(const UpgradeStorageOneBottomsheet());
                    // Get.off(Refresh());
                  } else {
                    Navigator.of(context).pop();
                  }
                });
              });
            }

            return NavigationDecision.prevent;
          },
          onUrlChange: (UrlChange change) {},
          onHttpAuthRequest: (HttpAuthRequest request) {
            // openDialog(request);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.authorizedUrl.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: WebViewWidget(
                controller: controller,
              ),
            )));
  }

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
          text: " Payment Processing".tr, margin: EdgeInsets.only(left: 11.h)),
      // actions: [
      //   AppbarTrailingImage(
      //       imagePath: ImageConstant.imgOverflowMenu,
      //       margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 13.v))
      // ]
    );
  }

  //  Dialog errorDialog(context) {
  //   return Dialog(
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(5.0)), //this right here
  //     child: Container(
  //       height: 350.0,
  //       width: MediaQuery.of(context).size.width,
  //       child:
  //     ),
  //   );
  // }

  onTapArrowLeft() {
    Get.back();
  }
}
