import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/verify_email_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

/// A controller class for the VerifyEmailScreen.
///
/// This class manages the state of the VerifyEmailScreen, including the
/// current verifyEmailModelObj
class VerifyEmailController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<VerifyEmailModel> verifyEmailModelObj = VerifyEmailModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}
