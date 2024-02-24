import '../../../core/app_export.dart';/// This class is used in the [dataselectionpage_item_widget] screen.
class DataselectionpageItemModel {DataselectionpageItemModel({this.contacts, this.checkmarkImage, this.id, }) { contacts = contacts  ?? Rx("Contacts");checkmarkImage = checkmarkImage  ?? Rx(ImageConstant.imgCheckmarkBlue800);id = id  ?? Rx(""); }

Rx<String>? contacts;

Rx<String>? checkmarkImage;

Rx<String>? id;

 }
