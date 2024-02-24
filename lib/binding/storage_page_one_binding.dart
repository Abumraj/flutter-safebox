import '../controller/storage_page_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StoragePageOneScreen.
///
/// This class ensures that the StoragePageOneController is created when the
/// StoragePageOneScreen is first loaded.
class StoragePageOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoragePageOneController());
  }
}
