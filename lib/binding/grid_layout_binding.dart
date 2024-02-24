import '../controller/grid_layout_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GridLayoutScreen.
///
/// This class ensures that the GridLayoutController is created when the
/// GridLayoutScreen is first loaded.
class GridLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GridLayoutController());
  }
}
