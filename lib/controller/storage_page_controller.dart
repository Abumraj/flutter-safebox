import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/storage_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the StoragePageScreen.
///
/// This class manages the state of the StoragePageScreen, including the
/// current storagePageModelObj
class StoragePageController extends GetxController {
  TextEditingController upgradeController = TextEditingController();

  Rx<StoragePageModel> storagePageModelObj = StoragePageModel().obs;

  @override
  void onClose() {
    super.onClose();
    upgradeController.dispose();
  }
}
