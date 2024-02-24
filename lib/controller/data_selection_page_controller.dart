import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/data_selection_page_model.dart';

/// A controller class for the DataSelectionPageScreen.
///
/// This class manages the state of the DataSelectionPageScreen, including the
/// current dataSelectionPageModelObj
class DataSelectionPageController extends GetxController {
  Rx<DataSelectionPageModel> dataSelectionPageModelObj =
      DataSelectionPageModel().obs;

  Rx<bool> createfolder = false.obs;

  Rx<bool> uploadfiles = false.obs;

  Rx<bool> uploadphotosandvideos = false.obs;

  Rx<bool> uploadcontacts = false.obs;

  Rx<bool> scandocument = false.obs;

  Rx<bool> uploadaudio = false.obs;

  Rx<bool> uploadwhatsappbackup = false.obs;
}
