import '../controller/copy_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CopyPageScreen.
///
/// This class ensures that the CopyPageController is created when the
/// CopyPageScreen is first loaded.
class CopyPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CopyPageController());
  }
}
