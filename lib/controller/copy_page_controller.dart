import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/copy_page_model.dart';

/// A controller class for the CopyPageScreen.
///
/// This class manages the state of the CopyPageScreen, including the
/// current copyPageModelObj
class CopyPageController extends GetxController {
  Rx<CopyPageModel> copyPageModelObj = CopyPageModel().obs;

  Rx<bool> createfolder = false.obs;

  Rx<bool> uploadfiles = false.obs;

  Rx<bool> uploadphotosandvideos = false.obs;

  Rx<bool> uploadcontacts = false.obs;

  Rx<bool> scandocument = false.obs;

  Rx<bool> uploadaudio = false.obs;

  Rx<bool> uploadwhatsappbackup = false.obs;
}
