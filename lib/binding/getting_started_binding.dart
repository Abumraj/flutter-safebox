import '../controller/getting_started_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GettingStartedScreen.
///
/// This class ensures that the GettingStartedController is created when the
/// GettingStartedScreen is first loaded.
class GettingStartedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GettingStartedController());
  }
}
