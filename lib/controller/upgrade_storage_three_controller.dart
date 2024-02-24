import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/upgrade_storage_three_model.dart';

/// A controller class for the UpgradeStorageThreeScreen.
///
/// This class manages the state of the UpgradeStorageThreeScreen, including the
/// current upgradeStorageThreeModelObj
class UpgradeStorageThreeController extends GetxController {
  Rx<UpgradeStorageThreeModel> upgradeStorageThreeModelObj =
      UpgradeStorageThreeModel().obs;

  Rx<String> radioGroup = "".obs;

  Rx<String> radioGroup1 = "".obs;

  Rx<String> radioGroup2 = "".obs;

  Rx<bool> createFolder = false.obs;

  Rx<bool> uploadFiles = false.obs;

  Rx<bool> uploadPhotosAndVideos = false.obs;

  Rx<bool> uploadContacts = false.obs;

  Rx<bool> scanDocument = false.obs;

  Rx<bool> uploadAudio = false.obs;

  Rx<bool> uploadWhatsappBackup = false.obs;
}
