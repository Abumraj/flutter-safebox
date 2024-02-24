import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/delete_page_model.dart';

/// A controller class for the DeletePageDialog.
///
/// This class manages the state of the DeletePageDialog, including the
/// current deletePageModelObj
class DeletePageController extends GetxController {
  Rx<DeletePageModel> deletePageModelObj = DeletePageModel().obs;
}
