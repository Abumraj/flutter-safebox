import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/photos_page_model.dart';

/// A controller class for the PhotosPageScreen.
///
/// This class manages the state of the PhotosPageScreen, including the
/// current photosPageModelObj
class PhotosPageController extends GetxController {
  Rx<PhotosPageModel> photosPageModelObj = PhotosPageModel().obs;

  Rx<bool> createFolder = false.obs;

  Rx<bool> uploadFiles = false.obs;

  Rx<bool> uploadPhotosAndVideos = false.obs;

  Rx<bool> uploadContacts = false.obs;

  Rx<bool> scanDocument = false.obs;

  Rx<bool> uploadAudio = false.obs;

  Rx<bool> uploadWhatsappBackup = false.obs;
}
