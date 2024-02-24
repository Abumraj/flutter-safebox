import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/copy_to_my_design_model.dart';

/// A controller class for the CopyToMyDesignScreen.
///
/// This class manages the state of the CopyToMyDesignScreen, including the
/// current copyToMyDesignModelObj
class CopyToMyDesignController extends GetxController {
  Rx<CopyToMyDesignModel> copyToMyDesignModelObj = CopyToMyDesignModel().obs;

  Rx<bool> createFolder = false.obs;

  Rx<bool> uploadFiles = false.obs;

  Rx<bool> uploadPhotosAndVideos = false.obs;

  Rx<bool> uploadContacts = false.obs;

  Rx<bool> scanDocument = false.obs;

  Rx<bool> uploadAudio = false.obs;

  Rx<bool> uploadWhatsappBackup = false.obs;
}
