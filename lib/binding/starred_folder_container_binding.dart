import '../controller/starred_folder_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StarredFolderContainerScreen.
///
/// This class ensures that the StarredFolderContainerController is created when the
/// StarredFolderContainerScreen is first loaded.
class StarredFolderContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StarredFolderContainerController());
  }
}
