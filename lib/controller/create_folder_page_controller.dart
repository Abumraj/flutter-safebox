import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/create_folder_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CreateFolderPageDialog.
///
/// This class manages the state of the CreateFolderPageDialog, including the
/// current createFolderPageModelObj
class CreateFolderPageController extends GetxController {
  TextEditingController nameController = TextEditingController();

  Rx<CreateFolderPageModel> createFolderPageModelObj =
      CreateFolderPageModel().obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
  }
}
