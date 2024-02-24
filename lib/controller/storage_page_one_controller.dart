import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/storage_page_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the StoragePageOneScreen.
///
/// This class manages the state of the StoragePageOneScreen, including the
/// current storagePageOneModelObj
class StoragePageOneController extends GetxController {
  TextEditingController upgradeController = TextEditingController();

  Rx<StoragePageOneModel> storagePageOneModelObj = StoragePageOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    upgradeController.dispose();
  }
}
