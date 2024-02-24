import '../controller/unstarred_folder_page_display_message_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UnstarredFolderPageDisplayMessageScreen.
///
/// This class ensures that the UnstarredFolderPageDisplayMessageController is created when the
/// UnstarredFolderPageDisplayMessageScreen is first loaded.
class UnstarredFolderPageDisplayMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UnstarredFolderPageDisplayMessageController());
  }
}
