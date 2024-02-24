import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/whatsapp_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the WhatsappPageScreen.
///
/// This class manages the state of the WhatsappPageScreen, including the
/// current whatsappPageModelObj
class WhatsappPageController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<WhatsappPageModel> whatsappPageModelObj = WhatsappPageModel().obs;

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
