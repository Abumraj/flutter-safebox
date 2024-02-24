import '../../../core/app_export.dart';import 'dataselectionpage_item_model.dart';/// This class defines the variables used in the [data_selection_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DataSelectionPageModel {Rx<List<DataselectionpageItemModel>> dataselectionpageItemList = Rx([DataselectionpageItemModel(contacts: "Contacts".obs,checkmarkImage:ImageConstant.imgCheckmarkBlue800.obs),DataselectionpageItemModel(contacts: "Audio".obs,checkmarkImage:ImageConstant.imgTwitter.obs),DataselectionpageItemModel(contacts: "Video".obs,checkmarkImage:ImageConstant.imgTwitter.obs),DataselectionpageItemModel(contacts: "Documents".obs,checkmarkImage:ImageConstant.imgTwitter.obs),DataselectionpageItemModel(contacts: "Whatsapp".obs,checkmarkImage:ImageConstant.imgTwitter.obs)]);

 }
