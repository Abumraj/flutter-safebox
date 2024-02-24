import '../../../core/app_export.dart';

/// This class is used in the [filescolumn_item_widget] screen.
class FilescolumnItemModel {
  FilescolumnItemModel({
    this.userImage,
    this.filesText,
    this.itemsText,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgMenuBlue800);
    filesText = filesText ?? Rx("Files");
    itemsText = itemsText ?? Rx("2 items");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? filesText;

  Rx<String>? itemsText;

  Rx<String>? id;
}
