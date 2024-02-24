import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/starred_folder_display_message_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the StarredFolderDisplayMessageScreen.
///
/// This class manages the state of the StarredFolderDisplayMessageScreen, including the
/// current starredFolderDisplayMessageModelObj
class StarredFolderDisplayMessageController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<StarredFolderDisplayMessageModel> starredFolderDisplayMessageModelObj =
      StarredFolderDisplayMessageModel().obs;

  Rx<bool> createFolder = false.obs;

  Rx<bool> uploadFiles = false.obs;

  Rx<bool> uploadPhotosAndVideos = false.obs;

  Rx<bool> uploadContacts = false.obs;

  Rx<bool> scanDocument = false.obs;

  Rx<bool> uploadAudio = false.obs;

  Rx<bool> uploadWhatsappBackup = false.obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
