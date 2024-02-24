import 'package:safebox/controller/verify_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/presentation/getting_started_screen.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_pin_code_text_field.dart';

// ignore_for_file: must_be_immutable
class VerifyEmailScreen extends GetWidget<VerifyEmailController> {
  VerifyEmailScreen({Key? key})
      : super(
          key: key,
        );

  final VerifyEmailController verifyEmailController =
      Get.put(VerifyEmailController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 36.v,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgMail,
                height: 36.v,
                width: 46.h,
              ),
              SizedBox(height: 16.v),
              Text(
                "msg_verify_phone_number".tr,
                style: CustomTextStyles.titleLargeOpenSansIndigo900,
              ),
              SizedBox(height: 3.v),
              SizedBox(
                width: 175.h,
                child: Text(
                  "msg_enter_the_4_digit".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMedium_3.copyWith(
                    height: 1.36,
                  ),
                ),
              ),
              SizedBox(height: 40.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.h),
                child: Obx(
                  () => CustomPinCodeTextField(
                    context: Get.context!,
                    controller: controller.otpController.value,
                    onChanged: (value) {
                      controller.otpController.value.text = value;
                      print(controller.otpController.value);
                    },
                  ),
                ),
              ),
              SizedBox(height: 23.v),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "msg_didn_t_receive_code2".tr,
                      style: CustomTextStyles.bodyMedium_2,
                    ),
                    const TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: "lbl_send_again".tr,
                      style: CustomTextStyles.bodyMediumBlue800,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 43.v),
              CustomElevatedButton(
                height: 50.v,
                text: "lbl_verify".tr,
                buttonStyle: CustomButtonStyles.outlinePrimary,
                buttonTextStyle:
                    CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold,
                onPressed: () {
                  Get.to(GettingStartedScreen());
                },
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
