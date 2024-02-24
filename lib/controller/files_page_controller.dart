import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/files_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the FilesPageScreen.
///
/// This class manages the state of the FilesPageScreen, including the
/// current filesPageModelObj
class FilesPageController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<FilesPageModel> filesPageModelObj = FilesPageModel().obs;

  Rx<bool> createfolder = false.obs;

  Rx<bool> uploadfiles = false.obs;

  Rx<bool> uploadphotosandvideos = false.obs;

  Rx<bool> uploadcontacts = false.obs;

  Rx<bool> scandocument = false.obs;

  Rx<bool> uploadaudio = false.obs;

  Rx<bool> uploadwhatsappbackup = false.obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
