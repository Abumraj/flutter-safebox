import '../../../core/app_export.dart';/// This class is used in the [userfilessection_item_widget] screen.
class UserfilessectionItemModel {UserfilessectionItemModel({this.menuIcon, this.filesText, this.storageSize, this.itemsCount, this.id, }) { menuIcon = menuIcon  ?? Rx(ImageConstant.imgMenuBlue80045x45);filesText = filesText  ?? Rx("Files");storageSize = storageSize  ?? Rx("1.3GB");itemsCount = itemsCount  ?? Rx("200 items");id = id  ?? Rx(""); }

Rx<String>? menuIcon;

Rx<String>? filesText;

Rx<String>? storageSize;

Rx<String>? itemsCount;

Rx<String>? id;

 }
