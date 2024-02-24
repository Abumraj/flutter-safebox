import '../controller/navigation_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NavigationPageScreen.
///
/// This class ensures that the NavigationPageController is created when the
/// NavigationPageScreen is first loaded.
class NavigationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationPageController());
  }
}
