import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/move_page_model.dart';

/// A controller class for the MovePageScreen.
///
/// This class manages the state of the MovePageScreen, including the
/// current movePageModelObj
class MovePageController extends GetxController {
  Rx<MovePageModel> movePageModelObj = MovePageModel().obs;

  Rx<bool> createfolder = false.obs;

  Rx<bool> uploadfiles = false.obs;

  Rx<bool> uploadphotosandvideos = false.obs;

  Rx<bool> uploadcontacts = false.obs;

  Rx<bool> scandocument = false.obs;

  Rx<bool> uploadaudio = false.obs;

  Rx<bool> uploadwhatsappbackup = false.obs;
}
