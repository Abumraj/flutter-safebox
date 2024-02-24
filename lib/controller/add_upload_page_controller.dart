import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/add_upload_page_model.dart';

/// A controller class for the AddUploadPageBottomsheet.
///
/// This class manages the state of the AddUploadPageBottomsheet, including the
/// current addUploadPageModelObj
class AddUploadPageController extends GetxController {
  Rx<AddUploadPageModel> addUploadPageModelObj = AddUploadPageModel().obs;
}
