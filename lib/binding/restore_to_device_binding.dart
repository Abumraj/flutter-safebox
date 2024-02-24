import '../controller/restore_to_device_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RestoreToDeviceScreen.
///
/// This class ensures that the RestoreToDeviceController is created when the
/// RestoreToDeviceScreen is first loaded.
class RestoreToDeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestoreToDeviceController());
  }
}
