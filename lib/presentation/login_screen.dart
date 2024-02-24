import 'package:safebox/controller/create_account_controller.dart';
import 'package:safebox/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/core/utils/validation_functions.dart';
import 'package:safebox/presentation/change_password_screen.dart';
import 'package:safebox/presentation/create_account_screen.dart';
import 'package:safebox/widgets/custom_checkbox_button.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_outlined_button.dart';
import 'package:safebox/widgets/custom_text_form_field.dart';
import 'package:safebox/domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());
  final CreateAccountController _controller =
      Get.put(CreateAccountController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//    Platform  Firebase App Id
// web       1:217520767118:web:89628d85438ba7363a89df
// android   1:217520767118:android:1cff225821e4549c3a89df
// ios       1:217520767118:ios:f1b735ca04c2d8043a89df
// macos     1:217520767118:ios:d27ac18ee2bddc8e3a89df
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 42.v),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    CustomImageView(
                        imagePath: ImageConstant.imgFlag,
                        height: 43.v,
                        width: 35.h),
                    SizedBox(height: 17.v),
                    Text("msg_login_to_your_account".tr,
                        style: CustomTextStyles.titleLargeOpenSansIndigo900),
                    SizedBox(height: 3.v),
                    Text("msg_welcome_enter_your".tr,
                        style: CustomTextStyles.bodyMedium_3),
                    SizedBox(height: 23.v),
                    _buildLoginButton(),
                    SizedBox(height: 19.v),
                    ortext(),
                    SizedBox(height: 18.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("lbl_email_address2".tr,
                            style: CustomTextStyles.labelLargeSofiaPro)),
                    SizedBox(height: 6.v),
                    _buildEmailEditText(),
                    SizedBox(height: 19.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("lbl_password2".tr,
                            style: CustomTextStyles.labelLargeSofiaPro)),
                    SizedBox(height: 6.v),
                    _buildPasswordEditText(),
                    SizedBox(height: 10.v),
                    _buildRememberMeRow(),
                    SizedBox(height: 41.v),
                    _buildLoginButton1(),
                    SizedBox(height: 22.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "msg_don_t_have_an_account2".tr,
                                  style: CustomTextStyles.bodyMedium_2),
                              const TextSpan(text: " "),
                            ]),
                            textAlign: TextAlign.left),
                        GestureDetector(
                          onTap: () {
                            Get.to(CreateAccountScreen());
                          },
                          child: Text("lbl_create_account".tr,
                              style: CustomTextStyles.bodyMediumBlue800),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.v)
                  ]))),
    ));
  }

  /// Section Widget
  Widget _buildLoginButton() {
    return CustomOutlinedButton(
        text: "msg_login_with_google".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 10.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgGoogleglogo1,
                height: 18.adaptSize,
                width: 18.adaptSize)),
        buttonTextStyle: theme.textTheme.titleMedium!,
        onPressed: () {
          onTapLoginButton();
        });
  }

  Widget ortext() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
                height: 1.0,
                // width: 28.0.w,
                color: appTheme.gray40001),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text("lbl_or".tr,
                style: CustomTextStyles.titleSmallOpenSansOnPrimaryContainer),
          ),
          Flexible(
            child: Container(
                height: 1.0,
                // width: 28.0.w,
                color: appTheme.gray40001),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailEditText() {
    return CustomTextFormField(
        controller: controller.emailEditTextController,
        hintText: "Enter your Email address".tr,
        hintStyle: CustomTextStyles.titleMediumBlue800_1,
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildPasswordEditText() {
    return Obx(() => CustomTextFormField(
        controller: controller.passwordEditTextController,
        hintText: "Password".tr,
        hintStyle: CustomTextStyles.titleMediumBlue800_1,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        suffix: InkWell(
            onTap: () {
              controller.isShowPassword.value =
                  !controller.isShowPassword.value;
            },
            child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 16.v, 15.h, 16.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgEyeBlueGray900,
                    height: 18.adaptSize,
                    width: 18.adaptSize))),
        suffixConstraints: BoxConstraints(maxHeight: 50.v),
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "Password must contain upper case, lower case, digit, special character and no white space"
                .tr;
          }
          return null;
        },
        obscureText: controller.isShowPassword.value,
        contentPadding: EdgeInsets.only(left: 20.h, top: 17.v, bottom: 17.v)));
  }

  /// Section Widget
  Widget _buildRememberMeRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: Obx(() => CustomCheckboxButton(
              text: "lbl_remember_me".tr,
              value: controller.englishLabel.value,
              textStyle: CustomTextStyles.bodySmallBlack90001,
              onChange: (value) {
                controller.englishLabel.value = value;
              }))),
      GestureDetector(
          onTap: () {
            Get.to(ChangePasswordScreen());
          },
          child: Text("msg_forgot_password".tr,
              style: CustomTextStyles.bodySmallBlue800_1))
    ]);
  }

  /// Section Widget
  Widget _buildLoginButton1() {
    return CustomElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            controller.login();
          }
        },
        height: 50.v,
        text: "lbl_login".tr,
        buttonStyle: CustomButtonStyles.outlinePrimary,
        buttonTextStyle: CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold);
  }

  onTapLoginButton() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        _controller.googleLogin(
            googleUser.displayName, googleUser.email, false);
      } else {
        // Get.snackbar('Error', 'user data is empty');
        ProgressDialogUtils.showFailureToast('No Email Choosen');
      }
    }).catchError((onError) {
      ProgressDialogUtils.showFailureToast('An error occurred');
    });
  }
}
