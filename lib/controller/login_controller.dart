import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/presentation/home_page_screen.dart';
import 'package:safebox/presentation/verify_email_screen.dart';

/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginController extends GetxController {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  final AccountController _accountController = Get.put(AccountController());
  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController passwordEditTextController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> englishLabel = false.obs;
  Rx<bool> isPasswordEmpty = true.obs;

  // @override
  // void onClose() {
  //   super.onClose();
  //   // emailEditTextController.dispose();
  //   // passwordEditTextController.dispose();
  // }

  login() {
    ProgressDialogUtils.showProgressDialog();
    var data = {
      'email': emailEditTextController.text,
      'password': passwordEditTextController.text,
    };
    _apiRepositoryImplementation.postLogin(data).then((value) async {
      if (value == "error") {
        ProgressDialogUtils.showFailureToast(
            'An error ocurred. Please check your internet connection');
      }
      // print(value);
      if (value['message'] == 'login successful') {
        await Constants.saveUserTokenSharedPreference(value['token']);
        await Constants.saveUserLoggedInSharedPreference(englishLabel.value);
        _accountController.refreshProfile(true);
        ProgressDialogUtils.hideProgressDialog();
        if (value['is_verified'] == 0) {
          // Get.off(VerifyEmailScreen(
          //   phoneNumber: value['phone'],
          // ));
          Get.off(const HomePageScreen());
        } else {
          Get.off(const HomePageScreen());
        }
      } else if (value['message'] == 'The provided credentials are incorrect') {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showFailureToast(
            'The provided credentials are incorrect');
      }
      ProgressDialogUtils.hideProgressDialog();
    });
    update();
  }
}
