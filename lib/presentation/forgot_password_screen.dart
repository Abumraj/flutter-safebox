import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:safebox/controller/create_account_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_elevated_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final CreateAccountController controller = Get.put(CreateAccountController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30.h,
              right: 30.h,
              bottom: 53.v,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 3.v),
                SizedBox(
                  width: 220.h,
                  child: Text(
                    "Enter the phone number associated with your account on safebox for verification",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMedium_3.copyWith(
                      height: 1.36,
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                _buildPhoneNumber(),
                SizedBox(height: 43.v),
                CustomElevatedButton(
                  height: 50.v,
                  text: "Send Code".tr,
                  buttonStyle: CustomButtonStyles.outlinePrimary,
                  buttonTextStyle:
                      CustomTextStyles.titleMediumOpenSansWhiteA700SemiBold,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.phoneExist();
                    }
                  },
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowLeft() {
    Get.back();
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 13.v, bottom: 12.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarTitle(
            text: "lbl_password2".tr, margin: EdgeInsets.only(left: 10.h)));
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
}
