import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/domain/googleauth/google_auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:safebox/presentation/getting_started_screen.dart';
import 'package:safebox/presentation/home_page_screen.dart';
import 'package:safebox/presentation/verify_email_screen.dart';

/// A controller class for the CreateAccountScreen.
/// This class manages the state of the CreateAccountScreen, including the
/// current createAccountModelObj
class CreateAccountController extends GetxController {
  // final termii = Termii(
  //   url: 'https://api.ng.termii.com',
  //   apiKey: 'TL5lEKuMU1BWSJUsqivA4dN2RxVT5BZQ5aEu0ja76f7qX8zNdPBAhTLv40WV2Z',
  //   senderId: 'SAFEBOX AFRICA',
  // );
  String termiiApiKey =
      'TL5lEKuMU1BWSJUsqivA4dN2RxVT5BZQ5aEu0ja76f7qX8zNdPBAhTLv40WV2Z';
  String termiiSenderId = 'safebox';
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  final AccountController _accountController = Get.put(AccountController());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<String> selectedCountry = ''.obs;
  Rx<String> dialcode = '234'.obs;

  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isPasswordEmpty = true.obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  Future<String> sendPhoneVrificationCode(destination) async {
    ProgressDialogUtils.showProgressDialog();

    print(destination);
    String pin = '';
    var data = {
      'api_key': termiiApiKey,
      'message_type': 'ALPHANUMERIC',
      'to': destination,
      'from': termiiSenderId,
      'channel': 'generic',
      'pin_attempts': 3,
      'pin_time_to_live': 1,
      'pin_length': 4,
      "pin_placeholder": "<1234>",
      "message_text":
          "Thank you for using Safebox. Your verification code is <1234>",
      'pin_type': 'NUMERIC'
    };

    {
      // "pinId": "29ae67c2-c8e1-4165-8a51-8d3d7c298081",
      // "to": "2348109077743",
      // "smsStatus": "Message Sent"
    }
    _apiRepositoryImplementation
        .postPhoneVerificationRequest(data)
        .then((value) {
      pin = value['pin'];
      print(value);
      // if (value['smsStatus'] == 'Message Sent') {
      //   // await sendPhoneVrificationCode(
      //   //     "${dialcode.value}${phoneNumberController.text}");
      //   // ProgressDialogUtils.hideProgressDialog();

      // } else {
      //   ProgressDialogUtils.hideProgressDialog();
      // }
    });
    ProgressDialogUtils.hideProgressDialog();

    return pin;
    // await termii.sendToken(
    //     destination: destination,
    //     messageType: MessageType.numeric,
    //     pinAttempts: 3,
    //     pinExpiryTime: 1,
    //     pinLength: 4,
    //     pinPlaceholder: 'gen',
    //     messageText:
    //         "Thank you for using our service. Your verification code is ",
    //     pinType: MessageType.numeric);
  }

  confirmPhoeVerificationCode(pinId, pin) async {
    ProgressDialogUtils.showProgressDialog();

    var data = {
      'api_key': termiiApiKey,
      'pin_id': pinId,
      'pin': pin,
    };

    {
      {
        //  "pinId": "c8dcd048-5e7f-4347-8c89-4470c3af0b",
        //  "verified": "True",
        //  "msisdn": "2348109077743"
      }
    }
    _apiRepositoryImplementation
        .postConfirmPhoneVerificationcode(data)
        .then((value) {
      if (value['verified'] == true) {
        // await sendPhoneVrificationCode(
        //     "${dialcode.value}${phoneNumberController.text}");
        // ProgressDialogUtils.hideProgressDialog();
        _apiRepositoryImplementation.getUpdatePhoneVerify();
        Constants.saveUserLoggedInSharedPreference(true);

        Get.off(const GettingStartedScreen());
      } else {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showFailureToast("Pin Incorrect or expired");
      }
    });
  }

  register() async {
    ProgressDialogUtils.showProgressDialog();
    if (selectedCountry.value.toLowerCase() == "nigeria") {
      dialcode.value = "234";
    }
    var data = {
      'name': fullNameController.text,
      'email': emailController.text,
      'phone_number': dialcode.value + phoneNumberController.text,
      'country': selectedCountry.value,
      'password': passwordController.value.text,
      'password_confirmation': passwordController.text,
      'referral_code': referralCodeController.text
    };
    print(data["phone_number"].toString().characters.length);
    _apiRepositoryImplementation.postRegister(data).then((value) async {
      if (value['message'] == 'you have successfully registered') {
        // _accountController.refreshProfile(true);

        // await sendPhoneVrificationCode(
        //     dialcode.value + phoneNumberController.text);
        await Constants.saveUserTokenSharedPreference(value['token']);
        Get.off(VerifyEmailScreen(
          phoneNumber: dialcode.value + phoneNumberController.text,
          // referenceId: value['pinId'],
        ));
        // ProgressDialogUtils.hideProgressDialog();

        // Get.off(VerifyEmailScreen(
        //   phoneNumber: data["phone_number"]!,
        // ));
      } else {
        ProgressDialogUtils.hideProgressDialog();
      }
    });
    // update();
  }

  googleLogin(name, email, bool isRegister) {
    ProgressDialogUtils.showProgressDialog();
    // print(email);
    var data = {
      'name': name,
      'email': email,
    };

    _apiRepositoryImplementation.postGoogleLogin(data).then((value) {
      if (value['message'] == 'you have successfully registered') {
        Constants.saveUserTokenSharedPreference(value['token']);
        _accountController.refreshProfile(true);

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
