import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/grid_layout_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the GridLayoutScreen.
///
/// This class manages the state of the GridLayoutScreen, including the
/// current gridLayoutModelObj
class GridLayoutController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<GridLayoutModel> gridLayoutModelObj = GridLayoutModel().obs;

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
