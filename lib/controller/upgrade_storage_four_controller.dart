import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/upgrade_storage_four_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the UpgradeStorageFourBottomsheet.
///
/// This class manages the state of the UpgradeStorageFourBottomsheet, including the
/// current upgradeStorageFourModelObj
class UpgradeStorageFourController extends GetxController {
  TextEditingController addCardRowController = TextEditingController();

  TextEditingController expiryDateRowController = TextEditingController();

  TextEditingController cvvRowController = TextEditingController();

  Rx<UpgradeStorageFourModel> upgradeStorageFourModelObj =
      UpgradeStorageFourModel().obs;

  @override
  void onClose() {
    super.onClose();
    addCardRowController.dispose();
    expiryDateRowController.dispose();
    cvvRowController.dispose();
  }
}
