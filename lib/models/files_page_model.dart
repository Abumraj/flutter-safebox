import '../../../core/app_export.dart';
import 'userfiles_item_model.dart';

/// This class defines the variables used in the [files_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FilesPageModel extends GetxController {
  Rx<List<UserfilesItemModel>> userfilesItemList = Rx([]);

  @override
  void onInit() {
    super.onInit();
  }
}
