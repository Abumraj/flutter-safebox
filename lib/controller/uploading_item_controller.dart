import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/uploading_item_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the UploadingItemScreen.
///
/// This class manages the state of the UploadingItemScreen, including the
/// current uploadingItemModelObj
class UploadingItemController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<UploadingItemModel> uploadingItemModelObj = UploadingItemModel().obs;

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
