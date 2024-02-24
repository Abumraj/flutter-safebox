import '../controller/data_selection_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DataSelectionPageScreen.
///
/// This class ensures that the DataSelectionPageController is created when the
/// DataSelectionPageScreen is first loaded.
class DataSelectionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataSelectionPageController());
  }
}
