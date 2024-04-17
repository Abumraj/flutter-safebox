import 'package:safebox/core/app_export.dart';
import 'package:flutter/material.dart';

/// A controller class for the CreateFolderPageDialog.
///
/// This class manages the state of the CreateFolderPageDialog, including the
/// current createFolderPageModelObj
class CreateFolderPageController extends GetxController {
  TextEditingController nameController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
  }
}
