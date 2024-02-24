import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/contact_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ContactPageScreen.
///
/// This class manages the state of the ContactPageScreen, including the
/// current contactPageModelObj
class ContactPageController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<ContactPageModel> contactPageModelObj = ContactPageModel().obs;

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
