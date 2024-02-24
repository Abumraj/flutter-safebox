import 'package:safebox/controller/account_controller.dart';
import '../../../core/app_export.dart';
import 'filescolumn_item_model.dart';
import 'mydesigns_item_model.dart';
import 'userfile_item_model.dart';
import 'fileinfo_item_model.dart';

/// This class defines the variables used in the [added_folder_one_page],
/// and is typically used to hold data that is passed between different parts of the application.
class AddedFolderOneModel {
  final AccountController accountController = Get.put(AccountController());

  Rx<List<FilescolumnItemModel>> filescolumnItemList = Rx([
    FilescolumnItemModel(
        userImage: ImageConstant.imgMenuBlue800.obs,
        filesText: "Files".obs,
        itemsText: "0 items".obs),
    FilescolumnItemModel(
        userImage: ImageConstant.imgIcBaselineInsertPhoto.obs,
        filesText: "Photos".obs,
        itemsText: "0 items".obs),
    FilescolumnItemModel(
        userImage: ImageConstant.imgVideoCamera.obs,
        filesText: "Videos".obs,
        itemsText: "0 item".obs),
    FilescolumnItemModel(
        userImage: ImageConstant.imgAntDesignAudioFilledPurple400.obs,
        filesText: "Audios".obs,
        itemsText: "0 item".obs),
    FilescolumnItemModel(
        userImage: ImageConstant.imgUser.obs,
        filesText: "Contacts".obs,
        itemsText: "0 item".obs),
    FilescolumnItemModel(
        userImage: ImageConstant.imgRiWhatsappFill.obs,
        filesText: "Whatsapp".obs,
        itemsText: "1 item".obs)
  ]);

  AddedFolderOneModel() {
    // Initialize the observables after the controller is ready
    filescolumnItemList.value.forEach((item) {
      if (item.filesText!.value == "Files") {
        item.filesText!.value =
            "${accountController.accountModelObj.value.documentCount} items";
      } else if (item.filesText!.value == "Photos") {
        item.itemsText!.value =
            "${accountController.accountModelObj.value.photoCount} items";
      } else if (item.filesText!.value == "Videos") {
        item.itemsText!.value =
            "${accountController.accountModelObj.value.videoCount} items";
      } else if (item.filesText!.value == "Audios") {
        item.itemsText!.value =
            "${accountController.accountModelObj.value.audioCount} items";
      } else if (item.filesText!.value == "Contacts") {
        item.itemsText!.value = "0 item";
      } else if (item.filesText!.value == "Whatsapp") {
        item.itemsText!.value =
            "${accountController.accountModelObj.value.whatsappCount} items";
      }
    });
  }

  Rx<List<MydesignsItemModel>> mydesignsItemList = Rx([
    MydesignsItemModel(
        userImage: ImageConstant.imgCarbonFolderBlue20036x36.obs,
        myDesigns: "My designs".obs,
        fileSize: "0.0KB".obs,
        timeAgo: "1 sec ago".obs),
    MydesignsItemModel(
        userImage: ImageConstant.imgRectangle284.obs,
        myDesigns: "bay of fires tasmania.jpg".obs,
        fileSize: "111.0KB".obs,
        timeAgo: "2hrs ago".obs)
  ]);

  Rx<List<UserfileItemModel>> userfileItemList = Rx([
    UserfileItemModel(
        fileName: "PDF".obs,
        weburl: "statement.pdf".obs,
        fileSize: "2.1KB".obs,
        fileTime: "5:30 pm".obs),
    UserfileItemModel(
        fileName: "W".obs,
        weburl: "Documented process.docx".obs,
        fileSize: "1.1KB".obs,
        fileTime: "10:00 am".obs),
    UserfileItemModel(
        weburl: "workspace.png".obs,
        fileSize: "48.1KB".obs,
        fileTime: "2:10 pm".obs)
  ]);

  Rx<List<FileinfoItemModel>> fileinfoItemList = Rx([
    FileinfoItemModel(
        fileImage: ImageConstant.imgFileGreenA400.obs,
        fileName: "stickers.db.crypt12".obs,
        fileSize: "49.57MB".obs,
        fileTime: "12:00 am".obs)
  ]);
}
