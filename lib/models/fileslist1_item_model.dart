import '../../../core/app_export.dart';/// This class is used in the [fileslist1_item_widget] screen.
class Fileslist1ItemModel {Fileslist1ItemModel({this.menuImage, this.files, this.id, }) { menuImage = menuImage  ?? Rx(ImageConstant.imgMenu);files = files  ?? Rx("Files");id = id  ?? Rx(""); }

Rx<String>? menuImage;

Rx<String>? files;

Rx<String>? id;

 }
