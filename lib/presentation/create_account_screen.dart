import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:safebox/controller/create_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/core/utils/validation_functions.dart';
import 'package:safebox/domain/googleauth/google_auth_helper.dart';
import 'package:safebox/presentation/login_screen.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';
import 'package:safebox/widgets/custom_outlined_button.dart';
import 'package:safebox/widgets/custom_text_form_field.dart';
// import 'package:country_pickers/country.dart';

// ignore_for_file: must_be_immutable
class CreateAccountScreen extends GetWidget<CreateAccountController> {
  CreateAccountScreen({Key? key})
      : super(
          key: key,
        );
  final CreateAccountController createAccountController =
      Get.put(CreateAccountController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 36.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 30.h,
                      right: 30.h,
                      bottom: 53.v,
                    ),
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgFlag,
                          height: 43.v,
                          width: 35.h,
                        ),
                        SizedBox(height: 14.v),
                        Text(
                          "msg_create_an_account".tr,
                          style: CustomTextStyles.titleLargeOpenSansIndigo900,
                        ),
                        SizedBox(height: 5.v),
                        Text(
                          "msg_sign_up_now_to_get".tr,
                          style: CustomTextStyles.bodyMedium_3,
                        ),
                        SizedBox(height: 23.v),
                        _buildSignUpWithGoogle(),
                        SizedBox(height: 19.v),
                        _buildThirteen(),
                        SizedBox(height: 18.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_fullname2".tr,
                                  style: CustomTextStyles
                                      .labelLargeSofiaProGray500,
                                ),
                                TextSpan(
                                  text: "lbl".tr,
                                  style:
                                      CustomTextStyles.labelLargeSofiaProRed500,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 6.v),
                        _buildFullName(),
                        SizedBox(height: 19.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_email_address2".tr,
                                  style: CustomTextStyles
                                      .labelLargeSofiaProGray500,
                                ),
                                TextSpan(
                                  text: "lbl".tr,
                                  style:
                                      CustomTextStyles.labelLargeSofiaProRed500,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 6.v),
                        _buildEmail(),
                        SizedBox(height: 19.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_phone_number2".tr,
                                  style: CustomTextStyles
                                      .labelLargeSofiaProGray500,
                                ),
                                TextSpan(
                                  text: "lbl".tr,
                                  style:
                                      CustomTextStyles.labelLargeSofiaProRed500,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 6.v),
                        _buildPhoneNumber(),
                        SizedBox(height: 19.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_password2".tr,
                                  style: CustomTextStyles
                                      .labelLargeSofiaProGray500,
                                ),
                                TextSpan(
                                  text: "lbl".tr,
                                  style:
                                      CustomTextStyles.labelLargeSofiaProRed500,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 6.v),
                        _buildPassword(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_password2".tr,
                                  style: CustomTextStyles
                                      .labelLargeSofiaProGray500,
                                ),
                                TextSpan(
                                  text: "lbl".tr,
                                  style:
                                      CustomTextStyles.labelLargeSofiaProRed500,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 6.v),
                        _buildReferral(),
                        SizedBox(height: 40.v),
                        _buildCreateAccount(),
                        SizedBox(height: 23.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "msg_already_have_an2".tr,
                                      style: CustomTextStyles.bodyMedium_2),
                                  const TextSpan(text: " "),
                                ]),
                                textAlign: TextAlign.left),
                            GestureDetector(
                              onTap: () {
                                Get.to(LoginScreen());
                              },
                              child: Text("lbl_login".tr,
                                  style: CustomTextStyles.bodyMediumBlue800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUpWithGoogle() {
    return CustomOutlinedButton(
      onPressed: () {
        onTapLoginButton();
      },
      text: "msg_sign_up_with_google".tr,
      leftIcon: Container(
        margin: EdgeInsets.only(right: 10.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogleglogo1,
          height: 18.adaptSize,
          width: 18.adaptSize,
        ),
      ),
    );
  }

  onTapLoginButton() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        controller.googleLogin(googleUser.displayName, googleUser.email, true);
      } else {
        ProgressDialogUtils.showFailureToast('No Email Choosen');
        // Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      ProgressDialogUtils.showFailureToast('An error occurred');
    });
  }

  /// Section Widget
  Widget _buildThirteen() {
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
  Widget _buildFullName() {
    return CustomTextFormField(
      controller: controller.fullNameController,
      hintText: "Enter your full name".tr,
      hintStyle: CustomTextStyles.titleMediumBlue800,
      // autofocus: false,
      validator: (value) {
        if (value == null) {
          return 'Fullname is required';
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildReferral() {
    return CustomTextFormField(
      controller: controller.referralCodeController,
      hintText: "Referral Code (optional)".tr,
      hintStyle: CustomTextStyles.titleMediumBlue800,
      autovalidateMode: AutovalidateMode.disabled,
    );
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
      controller: controller.emailController,
      textInputType: TextInputType.emailAddress,
      hintStyle: CustomTextStyles.titleMediumBlue800,
      hintText: "Enter your Email address".tr,
      validator: (value) {
        if (value == null || (!isValidEmail(value, isRequired: true))) {
          return "err_msg_please_enter_valid_email".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber() {
    return IntlPhoneField(
      decoration: InputDecoration(
        hintText: "Enter your phone number",
        hintStyle: CustomTextStyles.titleMediumBlue800,
        isDense: true,
        contentPadding: EdgeInsets.all(17.h),
        fillColor: appTheme.whiteA700,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.h),
          borderSide: BorderSide(
            color: appTheme.gray40001,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.h),
          borderSide: BorderSide(
            color: appTheme.gray40001,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.h),
          borderSide: BorderSide(
            color: appTheme.blue800,
            width: 1,
          ),
        ),
      ),
      initialCountryCode: 'NG',

      // initialValue: "+234",
      onCountryChanged: (value) {
        controller.selectedCountry.value = value.name;
        controller.dialcode.value == value.dialCode;
        // print(value.dialCode);
        // controller.phoneNumberController.value = value.dialCode;
      },
      controller: controller.phoneNumberController,
      validator: (p0) {
        if (!p0!.isValidNumber()) {
          return "err_msg_please_enter_valid_phone_number".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildPassword() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.passwordController,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        hintStyle: CustomTextStyles.titleMediumBlue800,
        hintText: "password".tr,
        suffix: InkWell(
          onTap: () {
            controller.isShowPassword.value = !controller.isShowPassword.value;
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 16.v,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgEye,
              height: 18.adaptSize,
              width: 18.adaptSize,
            ),
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 50.v,
        ),
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "Password must contain upper case, lower case, digit, special character and no white space"
                .tr;
          }
          return null;
        },
        obscureText: controller.isShowPassword.value,
      ),
    );
  }

  /// Section Widget
  Widget _buildCreateAccount() {
    return CustomElevatedButton(
      height: 50.v,
      text: "lbl_create_account".tr,
      buttonStyle: CustomButtonStyles.outlinePrimary,
      buttonTextStyle: CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold,
      onPressed: () {
        GoogleAuthHelper().verifyPhoneNumber();

        // if (_formKey.currentState!.validate()) {
        //   controller.register();
        // }
        // Get.to(VerifyEmailScreen());
      },
    );
  }
}
