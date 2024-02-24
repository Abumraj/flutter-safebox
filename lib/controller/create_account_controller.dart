import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/domain/googleauth/google_auth_helper.dart';
import 'package:safebox/models/create_account_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/presentation/getting_started_screen.dart';
import 'package:safebox/presentation/home_page_screen.dart';

/// A controller class for the CreateAccountScreen.
///
/// This class manages the state of the CreateAccountScreen, including the
/// current createAccountModelObj
class CreateAccountController extends GetxController {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  final AccountController _accountController = Get.put(AccountController());

  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<CreateAccountModel> createAccountModelObj = CreateAccountModel().obs;

  Rx<String> selectedCountry = ''.obs;
  Rx<String> dialcode = ''.obs;

  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  register() {
    ProgressDialogUtils.showProgressDialog();
    if (selectedCountry.value.toLowerCase() == "nigeria") {
      dialcode.value = "234";
    }
    var data = {
      'name': fullNameController.text,
      'email': emailController.text,
      'phone_number': dialcode.value + phoneNumberController.text,
      'country': selectedCountry.value,
      'password': passwordController.text,
      'password_confirmation': passwordController.text,
    };

    _apiRepositoryImplementation.postRegister(data).then((value) {
      if (value['message'] == 'you have successfully registered') {
        Constants.saveUserTokenSharedPreference(value['token']);
        _accountController.refreshProfile();

        ProgressDialogUtils.hideProgressDialog();

        Get.off(GettingStartedScreen());
      } else {
        ProgressDialogUtils.hideProgressDialog();
      }
    });
    update();
  }

  googleLogin(name, email, bool isRegister) {
    ProgressDialogUtils.showProgressDialog();
    print(email);
    var data = {
      'name': name,
      'email': email,
    };

    _apiRepositoryImplementation.postGoogleLogin(data).then((value) {
      if (value['message'] == 'you have successfully registered') {
        Constants.saveUserTokenSharedPreference(value['token']);
        _accountController.refreshProfile();

        ProgressDialogUtils.hideProgressDialog();

        isRegister
            ? Get.off(const GettingStartedScreen())
            : Get.off(const HomePageScreen());
      } else {
        GoogleAuthHelper().googleSignOutProcess();
        ProgressDialogUtils.showFailureToast(value['message']);
        ProgressDialogUtils.hideProgressDialog();
      }
    });
    // update();
  }
}
