import '../controller/added_folder_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddedFolderScreen.
///
/// This class ensures that the AddedFolderController is created when the
/// AddedFolderScreen is first loaded.
class AddedFolderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddedFolderController());
  }
}
