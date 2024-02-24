import '../../../core/app_export.dart';import 'fileslist_item_model.dart';/// This class defines the variables used in the [move_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MovePageModel {Rx<List<FileslistItemModel>> fileslistItemList = Rx([FileslistItemModel(menuImage:ImageConstant.imgMenu.obs,files: "Files".obs),FileslistItemModel(menuImage:ImageConstant.imgIcBaselineInsertPhoto.obs,files: "Photos".obs),FileslistItemModel(menuImage:ImageConstant.imgVideoCamera.obs,files: "Videos".obs),FileslistItemModel(menuImage:ImageConstant.imgAntDesignAudioFilledPurple400.obs,files: "Audios".obs),FileslistItemModel(menuImage:ImageConstant.imgUser.obs,files: "Contacts".obs)]);

 }
