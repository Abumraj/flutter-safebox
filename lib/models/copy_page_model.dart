import '../../../core/app_export.dart';import 'fileslist1_item_model.dart';/// This class defines the variables used in the [copy_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CopyPageModel {Rx<List<Fileslist1ItemModel>> fileslist1ItemList = Rx([Fileslist1ItemModel(menuImage:ImageConstant.imgMenu.obs,files: "Files".obs),Fileslist1ItemModel(menuImage:ImageConstant.imgIcBaselineInsertPhoto.obs,files: "Photos".obs),Fileslist1ItemModel(menuImage:ImageConstant.imgVideoCamera.obs,files: "Videos".obs),Fileslist1ItemModel(menuImage:ImageConstant.imgAntDesignAudioFilledPurple400.obs,files: "Audios".obs),Fileslist1ItemModel(menuImage:ImageConstant.imgUser.obs,files: "Contacts".obs)]);

 }
