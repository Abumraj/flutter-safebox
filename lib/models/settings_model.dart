import 'package:safebox/presentation/account_screen.dart';
import 'package:safebox/presentation/change_password_screen.dart';
import 'package:safebox/presentation/storage_page_one_screen.dart';
import 'package:safebox/presentation/storage_page_screen.dart';

import '../../../core/app_export.dart';
import 'profileinformation_item_model.dart';

/// This class defines the variables used in the [settings_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SettingsModel {
  Rx<List<ProfileinformationItemModel>> profileinformationItemList = Rx([
    ProfileinformationItemModel(
        userImage: ImageConstant.imgBxBxsUser.obs,
        profileInformation: "Account Information".obs,
        changeAccountInformation: "Change your account information".obs,
        screen: AccountScreen().obs,
        accountInformationArrow: ImageConstant.imgArrowRight.obs),
    ProfileinformationItemModel(
        userImage: ImageConstant.imgIcon24Lock.obs,
        profileInformation: "Change Password".obs,
        changeAccountInformation: "Change your password".obs,
        screen: ChangePasswordScreen().obs,
        accountInformationArrow: ImageConstant.imgArrowRight.obs),
    ProfileinformationItemModel(
        userImage: ImageConstant.imgBiCloudDownloadFill.obs,
        profileInformation: "Download Path".obs,
        changeAccountInformation: "/storage/emulated/0/SafeBoxBackup".obs,
        // screen: Down,
        accountInformationArrow: ImageConstant.imgArrowRight.obs),
    ProfileinformationItemModel(
        userImage: ImageConstant.imgBxsCloudUploadOnprimarycontainer.obs,
        profileInformation: "Space Used".obs,
        changeAccountInformation: "23% of  100GB".obs,
        screen: StoragePageScreen().obs,
        accountInformationArrow: ImageConstant.imgArrowRight.obs),
    // ProfileinformationItemModel(
    //     userImage: ImageConstant.imgFlagOnprimarycontainer.obs,
    //     profileInformation: "Automatic Backup".obs,
    //     // screen: ,
    //     changeAccountInformation: "Uploading schedule".obs)
  ]);
}
