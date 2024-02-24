import '../../../core/app_export.dart';/// This class is used in the [mydesigns_item_widget] screen.
class MydesignsItemModel {MydesignsItemModel({this.userImage, this.myDesigns, this.fileSize, this.timeAgo, this.id, }) { userImage = userImage  ?? Rx(ImageConstant.imgCarbonFolderBlue20036x36);myDesigns = myDesigns  ?? Rx("My designs");fileSize = fileSize  ?? Rx("0.0KB");timeAgo = timeAgo  ?? Rx("1 sec ago");id = id  ?? Rx(""); }

Rx<String>? userImage;

Rx<String>? myDesigns;

Rx<String>? fileSize;

Rx<String>? timeAgo;

Rx<String>? id;

 }
