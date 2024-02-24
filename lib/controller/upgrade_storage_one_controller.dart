import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/upgrade_storage_one_model.dart';

/// A controller class for the UpgradeStorageOneBottomsheet.
///
/// This class manages the state of the UpgradeStorageOneBottomsheet, including the
/// current upgradeStorageOneModelObj
class UpgradeStorageOneController extends GetxController {
  Rx<UpgradeStorageOneModel> upgradeStorageOneModelObj =
      UpgradeStorageOneModel().obs;
}
