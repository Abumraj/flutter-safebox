import '../controller/contact_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ContactPageScreen.
///
/// This class ensures that the ContactPageController is created when the
/// ContactPageScreen is first loaded.
class ContactPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactPageController());
  }
}
