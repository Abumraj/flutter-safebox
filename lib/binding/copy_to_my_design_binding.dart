import '../controller/copy_to_my_design_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CopyToMyDesignScreen.
///
/// This class ensures that the CopyToMyDesignController is created when the
/// CopyToMyDesignScreen is first loaded.
class CopyToMyDesignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CopyToMyDesignController());
  }
}
