import '../controller/move_to_my_design_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MoveToMyDesignScreen.
///
/// This class ensures that the MoveToMyDesignController is created when the
/// MoveToMyDesignScreen is first loaded.
class MoveToMyDesignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoveToMyDesignController());
  }
}
