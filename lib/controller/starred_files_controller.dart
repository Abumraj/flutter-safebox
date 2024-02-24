import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/starred_files_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the StarredFilesPage.
///
/// This class manages the state of the StarredFilesPage, including the
/// current starredFilesModelObj
class StarredFilesController extends GetxController {
  StarredFilesController(this.starredFilesModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<StarredFilesModel> starredFilesModelObj;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
