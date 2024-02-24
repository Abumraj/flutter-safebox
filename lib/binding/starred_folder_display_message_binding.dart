import '../controller/starred_folder_display_message_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StarredFolderDisplayMessageScreen.
///
/// This class ensures that the StarredFolderDisplayMessageController is created when the
/// StarredFolderDisplayMessageScreen is first loaded.
class StarredFolderDisplayMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StarredFolderDisplayMessageController());
  }
}
