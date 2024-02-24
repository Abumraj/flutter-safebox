import '../controller/photos_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PhotosPageScreen.
///
/// This class ensures that the PhotosPageController is created when the
/// PhotosPageScreen is first loaded.
class PhotosPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotosPageController());
  }
}
