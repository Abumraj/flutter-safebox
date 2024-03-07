import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:safebox/presentation/home_page_screen.dart';
import 'package:safebox/presentation/login_screen.dart';
import 'package:dio/dio.dart' as dio;

/// A controller class for the AccountScreen.
///
/// This class manages the state of the AccountScreen, including the
/// current accountModelObj
class AccountController extends GetxController {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  TextEditingController nameController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController bankController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<UserDetail> accountModelObj = UserDetail().obs;
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isRefreshProfile = false.obs;

  Rx<bool> isShowPassword1 = true.obs;

  Rx<bool> isShowPassword2 = true.obs;

  Rx<bool> createFolder = false.obs;

  Rx<bool> uploadFiles = false.obs;

  Rx<bool> uploadPhotosAndVideos = false.obs;

  Rx<bool> uploadContacts = false.obs;

  Rx<bool> scanDocument = false.obs;

  Rx<bool> uploadAudio = false.obs;

  Rx<bool> uploadWhatsappBackup = false.obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
  }

  refreshProfile() {
    // isRefreshProfile.toggle();
    _apiRepositoryImplementation.getUserDetail().then((value) {
      accountModelObj.value = value;
      nameController.text = accountModelObj.value.name.toString();
      emailController.text = accountModelObj.value.email.toString();
      phoneNumberController.text = accountModelObj.value.phone.toString();
      // isRefreshProfile.toggle();
      update();

      // print(accountModelObj.value);
    });
  }

  logout() {
    _apiRepositoryImplementation.getLogout().then((value) {
      Constants.saveUserLoggedInSharedPreference(false);
      Constants.saveUserTokenSharedPreference('');
      ProgressDialogUtils.hideProgressDialog();
      ProgressDialogUtils.showSuccessToast("Logged out successfully");
      Get.off(LoginScreen());
    });
  }

  updateProfile() {
    ProgressDialogUtils.showProgressDialog();

    var data = {
      'name': nameController.text,
      'phone_number': phoneNumberController.text,
      'bank': bankController.text,
      'account_number': accountNumberController.text,
      'account_name': accountNameController.text,
    };

    _apiRepositoryImplementation.postUpdateProfile(data).then((value) {
      if (value == "Profile updated successfully") {
        refreshProfile();
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showSuccessToast("Profile Updated Successfully");
        Get.off(const HomePageScreen());
      } else {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showSuccessToast("An Error Occurred");
      }
    });
    update();
  }

  updatePassword() {
    ProgressDialogUtils.showProgressDialog();
    var data = {
      'current_password': currentPasswordController.text,
      'password': passwordController.text,
      'password_confirmation': confirmPasswordController.text,
    };

    _apiRepositoryImplementation.postChangePassword(data).then((value) {
      if (value == "Password changed successfully") {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showSuccessToast("Password changed successfully");
        Get.off(const HomePageScreen());
      } else {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showFailureToast("An Error Occurred");
      }
    });
    update();
  }

  updateProfilePicture() async {
    final file = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowCompression: false,
    );

    if (file != null && file.count > 0) {
      dio.FormData formData = dio.FormData.fromMap({
        'user_image':
            await dio.MultipartFile.fromFile(File(file.files.first.path!).path),
      });

      _apiRepositoryImplementation.postUserImage(formData).then((value) {
        if (value == "Image uploaded successfully") {
          ProgressDialogUtils.hideProgressDialog();
          ProgressDialogUtils.showSuccessToast(
              "Profile Image Updated successfully");
          Get.off(const HomePageScreen());
        } else {
          ProgressDialogUtils.hideProgressDialog();
          ProgressDialogUtils.showFailureToast("An Error Occurred");
        }
      });
    }
  }
}
