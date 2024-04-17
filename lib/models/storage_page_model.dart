import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/models/filesection_item_model.dart';

import '../../../core/app_export.dart';

/// This class defines the variables used in the [storage_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class StoragePageModel {
  final AccountController accountController = Get.put(AccountController());

  Rx<List<FilesectionItemModel>> filesectionItemList = Rx([
    FilesectionItemModel(
        menuIcon: ImageConstant.imgMenuBlue80045x45.obs,
        fileName: "Files".obs,
        fileSize: "3.4KB".obs,
        fileCount: "2 items".obs),
    FilesectionItemModel(
        menuIcon: ImageConstant.imgIcBaselineInsertPhoto.obs,
        fileName: "Photos".obs,
        fileSize: "10.8MB".obs,
        fileCount: "2 items".obs),
    FilesectionItemModel(
        menuIcon: ImageConstant.imgVideoCamera.obs,
        fileName: "Videos".obs,
        fileSize: "293.78MB".obs,
        fileCount: "1 item".obs),
    FilesectionItemModel(
        menuIcon: ImageConstant.imgAntDesignAudioFilledPurple400.obs,
        fileName: "Audios".obs,
        fileSize: "0.0KB".obs,
        fileCount: "0 item".obs),
    FilesectionItemModel(
        menuIcon: ImageConstant.imgUser.obs,
        fileName: "Contacts".obs,
        fileSize: "0.0KB".obs,
        fileCount: "0 item".obs),
    FilesectionItemModel(
        menuIcon: ImageConstant.imgRiWhatsappFill.obs,
        fileName: "Whatsapp".obs,
        fileSize: "49.57MB".obs,
        fileCount: "3 item".obs)
  ]);

  StoragePageModel() {
    // Initialize the observables after the controller is ready
    filesectionItemList.value.forEach((item) {
      if (item.fileName!.value == "Files") {
        item.fileCount!.value =
            "${accountController.accountModelObj.value.documentCount} items";
        item.fileSize!.value =
            "${accountController.accountModelObj.value.sizeDocument}";
      } else if (item.fileName!.value == "Photos") {
        item.fileCount!.value =
            "${accountController.accountModelObj.value.photoCount} items";
        item.fileSize!.value =
            "${accountController.accountModelObj.value.sizePhoto}";
      } else if (item.fileName!.value == "Videos") {
        item.fileCount!.value =
            "${accountController.accountModelObj.value.videoCount} items";
        item.fileSize!.value =
            "${accountController.accountModelObj.value.sizeVideo}";
      } else if (item.fileName!.value == "Audios") {
        item.fileCount!.value =
            "${accountController.accountModelObj.value.audioCount} items";
        item.fileSize!.value =
            "${accountController.accountModelObj.value.sizeAudio} ";
      }
      // else if (item.filesText!.value == "Contacts") {
      //   item.itemsText!.value = "0 item";
      // }
      else if (item.fileName!.value == "Whatsapp") {
        item.fileCount!.value =
            "${accountController.accountModelObj.value.whatsappCount} items";
        item.fileSize!.value =
            "${accountController.accountModelObj.value.sizeWhatsapp}";
      }
    });
  }
}
