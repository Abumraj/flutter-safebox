import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/move_to_my_design_model.dart';

/// A controller class for the MoveToMyDesignScreen.
///
/// This class manages the state of the MoveToMyDesignScreen, including the
/// current moveToMyDesignModelObj
class MoveToMyDesignController extends GetxController {
  Rx<MoveToMyDesignModel> moveToMyDesignModelObj = MoveToMyDesignModel().obs;

  Rx<bool> createFolder = false.obs;

  Rx<bool> uploadFiles = false.obs;

  Rx<bool> uploadPhotosAndVideos = false.obs;

  Rx<bool> uploadContacts = false.obs;

  Rx<bool> scanDocument = false.obs;

  Rx<bool> uploadAudio = false.obs;

  Rx<bool> uploadWhatsappBackup = false.obs;
}
