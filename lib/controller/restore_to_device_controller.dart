import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/restore_to_device_model.dart';

/// A controller class for the RestoreToDeviceScreen.
///
/// This class manages the state of the RestoreToDeviceScreen, including the
/// current restoreToDeviceModelObj
class RestoreToDeviceController extends GetxController {
  Rx<RestoreToDeviceModel> restoreToDeviceModelObj = RestoreToDeviceModel().obs;

  Rx<bool> createFolder = false.obs;

  Rx<bool> uploadFiles = false.obs;

  Rx<bool> uploadPhotosAndVideos = false.obs;

  Rx<bool> uploadContacts = false.obs;

  Rx<bool> scanDocument = false.obs;

  Rx<bool> uploadAudio = false.obs;

  Rx<bool> uploadWhatsappBackup = false.obs;
}
