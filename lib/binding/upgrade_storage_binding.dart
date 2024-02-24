import '../controller/upgrade_storage_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UpgradeStorageScreen.
///
/// This class ensures that the UpgradeStorageController is created when the
/// UpgradeStorageScreen is first loaded.
class UpgradeStorageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpgradeStorageController());
  }
}
