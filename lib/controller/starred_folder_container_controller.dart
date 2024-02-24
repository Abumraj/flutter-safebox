import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/starred_folder_container_model.dart';

/// A controller class for the StarredFolderContainerScreen.
///
/// This class manages the state of the StarredFolderContainerScreen, including the
/// current starredFolderContainerModelObj
class StarredFolderContainerController extends GetxController {
  Rx<StarredFolderContainerModel> starredFolderContainerModelObj =
      StarredFolderContainerModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.onboardingScreenOneScreen,
      );
    });
  }
}
