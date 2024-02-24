import '../controller/uploading_item_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UploadingItemScreen.
///
/// This class ensures that the UploadingItemController is created when the
/// UploadingItemScreen is first loaded.
class UploadingItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadingItemController());
  }
}
