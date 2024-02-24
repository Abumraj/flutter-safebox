import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/sort_page_model.dart';

/// A controller class for the SortPageBottomsheet.
///
/// This class manages the state of the SortPageBottomsheet, including the
/// current sortPageModelObj
class SortPageController extends GetxController {
  Rx<SortPageModel> sortPageModelObj = SortPageModel().obs;
}
