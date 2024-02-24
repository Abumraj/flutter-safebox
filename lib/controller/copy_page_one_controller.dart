import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/copy_page_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CopyPageOneDialog.
///
/// This class manages the state of the CopyPageOneDialog, including the
/// current copyPageOneModelObj
class CopyPageOneController extends GetxController {
  TextEditingController nameController = TextEditingController();

  Rx<CopyPageOneModel> copyPageOneModelObj = CopyPageOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
  }
}
