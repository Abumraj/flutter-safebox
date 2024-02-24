import '../controller/storage_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StoragePageScreen.
///
/// This class ensures that the StoragePageController is created when the
/// StoragePageScreen is first loaded.
class StoragePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoragePageController());
  }
}
