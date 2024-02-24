import '../controller/upgrade_storage_three_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UpgradeStorageThreeScreen.
///
/// This class ensures that the UpgradeStorageThreeController is created when the
/// UpgradeStorageThreeScreen is first loaded.
class UpgradeStorageThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpgradeStorageThreeController());
  }
}
