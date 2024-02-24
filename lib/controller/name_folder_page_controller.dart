import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/name_folder_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the NameFolderPageDialog.
///
/// This class manages the state of the NameFolderPageDialog, including the
/// current nameFolderPageModelObj
class NameFolderPageController extends GetxController {
  TextEditingController myDesignsController = TextEditingController();

  Rx<NameFolderPageModel> nameFolderPageModelObj = NameFolderPageModel().obs;

  @override
  void onClose() {
    super.onClose();
    myDesignsController.dispose();
  }
}
