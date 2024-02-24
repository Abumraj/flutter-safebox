import '../controller/uploading_item_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UploadingItemOneScreen.
///
/// This class ensures that the UploadingItemOneController is created when the
/// UploadingItemOneScreen is first loaded.
class UploadingItemOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadingItemOneController());
  }
}
