import '../../../core/app_export.dart';

/// This class is used in the [filesection_item_widget] screen.
class FilesectionItemModel {
  FilesectionItemModel({
    this.menuIcon,
    this.fileName,
    this.fileSize,
    this.fileCount,
    this.id,
  }) {
    menuIcon = menuIcon ?? Rx(ImageConstant.imgMenuBlue80045x45);
    fileName = fileName ?? Rx("Files");
    fileSize = fileSize ?? Rx("3.4KB");
    fileCount = fileCount ?? Rx("2 items");
    id = id ?? Rx("");
  }

  Rx<String>? menuIcon;

  Rx<String>? fileName;

  Rx<String>? fileSize;

  Rx<String>? fileCount;

  Rx<String>? id;
}
