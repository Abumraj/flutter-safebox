import 'package:safebox/core/app_export.dart';
import 'package:flutter/material.dart';

/// A controller class for the RenameFolderDialog.
///
/// This class manages the state of the RenameFolderDialog, including the
/// current renameFolderModelObj
class RenameFolderController extends GetxController {
  TextEditingController nameController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
  }
}
