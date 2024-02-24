import '../controller/whatsapp_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WhatsappPageScreen.
///
/// This class ensures that the WhatsappPageController is created when the
/// WhatsappPageScreen is first loaded.
class WhatsappPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WhatsappPageController());
  }
}
