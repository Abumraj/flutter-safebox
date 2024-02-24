import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/upgrade_storage_two_model.dart';

/// A controller class for the UpgradeStorageTwoBottomsheet.
///
/// This class manages the state of the UpgradeStorageTwoBottomsheet, including the
/// current upgradeStorageTwoModelObj
class UpgradeStorageTwoController extends GetxController {
  Rx<UpgradeStorageTwoModel> upgradeStorageTwoModelObj =
      UpgradeStorageTwoModel().obs;
}
