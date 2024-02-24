import '../controller/move_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MovePageScreen.
///
/// This class ensures that the MovePageController is created when the
/// MovePageScreen is first loaded.
class MovePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovePageController());
  }
}
