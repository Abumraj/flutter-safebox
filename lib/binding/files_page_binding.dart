import '../controller/files_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FilesPageScreen.
///
/// This class ensures that the FilesPageController is created when the
/// FilesPageScreen is first loaded.
class FilesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilesPageController());
  }
}
