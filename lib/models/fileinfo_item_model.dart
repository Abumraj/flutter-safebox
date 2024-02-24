import '../../../core/app_export.dart';/// This class is used in the [fileinfo_item_widget] screen.
class FileinfoItemModel {FileinfoItemModel({this.fileImage, this.fileName, this.fileSize, this.fileTime, this.id, }) { fileImage = fileImage  ?? Rx(ImageConstant.imgFileGreenA400);fileName = fileName  ?? Rx("stickers.db.crypt12");fileSize = fileSize  ?? Rx("49.57MB");fileTime = fileTime  ?? Rx("12:00 am");id = id  ?? Rx(""); }

Rx<String>? fileImage;

Rx<String>? fileName;

Rx<String>? fileSize;

Rx<String>? fileTime;

Rx<String>? id;

 }
