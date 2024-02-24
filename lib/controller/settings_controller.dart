import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/settings_model.dart';

class SettingsController extends GetxController {
  Rx<SettingsModel> settingsModelObj = SettingsModel().obs;

  Rx<bool> createfolder = false.obs;

  Rx<bool> uploadfiles = false.obs;

  Rx<bool> uploadphotosandvideos = false.obs;

  Rx<bool> uploadcontacts = false.obs;

  Rx<bool> scandocument = false.obs;

  Rx<bool> uploadaudio = false.obs;

  Rx<bool> uploadwhatsappbackup = false.obs;
}
