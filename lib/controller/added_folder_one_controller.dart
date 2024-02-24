import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/added_folder_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddedFolderOnePage.
///
/// This class manages the state of the AddedFolderOnePage, including the
/// current addedFolderOneModelObj
class AddedFolderOneController extends GetxController {
  AddedFolderOneController(this.addedFolderOneModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<AddedFolderOneModel> addedFolderOneModelObj;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
