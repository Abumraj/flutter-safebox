import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/upgrade_storage_model.dart';

/// A controller class for the UpgradeStorageScreen.
///
/// This class manages the state of the UpgradeStorageScreen, including the
/// current upgradeStorageModelObj
class UpgradeStorageController extends GetxController {
  Rx<UpgradeStorageModel> upgradeStorageModelObj = UpgradeStorageModel().obs;

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
