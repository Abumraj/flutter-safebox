import '../../../core/app_export.dart';

/// This class is used in the [userfile_item_widget] screen.
class UserfileItemModel {
  UserfileItemModel({
    this.fileName,
    this.weburl,
    this.fileSize,
    this.fileTime,
    this.id,
  }) {
    fileName = fileName ?? Rx("PDF");
    weburl = weburl ?? Rx("statement.pdf");
    fileSize = fileSize ?? Rx("2.1KB");
    fileTime = fileTime ?? Rx("5:30 pm");
    id = id ?? Rx("");
  }

  Rx<String>? fileName;

  Rx<String>? weburl;

  Rx<String>? fileSize;

  Rx<String>? fileTime;

  Rx<String>? id;
}
