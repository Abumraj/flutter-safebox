import '../../../core/app_export.dart';
import 'fileoptions_item_model.dart';

/// This class defines the variables used in the [getting_started_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class GettingStartedModel extends GetxController {
  // final ApiRepositoryImplementation _apiRepositoryImplementation =
  //     Get.put(ApiRepositoryImplementation());
  List<FileoptionsItemModel> fileoptionsItemList = [];
  // List<bool> backupOptions = [];
  RxList<bool> backupOptions = <bool>[].obs;
  Rx<bool> isSelected = false.obs;
  Rx<bool> updateState = false.obs;

  updateBackUpOption(int index) {
    updateState.value = false;
    for (var i = 0; i < backupOptions.length; i++) {
      if (i == index) {
        if (backupOptions[i] == true) {
          backupOptions[i] = false;
          isSelected.value = false;
        } else {
          backupOptions[i] = true;
          isSelected.value = true;
        }
        // fileoptionsItemList[i].checkmarkImage = true;
      } else {
        backupOptions[i] = false;
        isSelected.value = false;
        // fileoptionsItemList[i].checkmarkImage = false;
      }
    }
    updateState.value = true;
    update();
  }

  // @override
  // void onInit() {
  //   productList();
  //   super.onInit();
  // }

  // productList() {
  //   ProgressDialogUtils.showProgressDialog();
  //   _apiRepositoryImplementation.getProductList().then((value) {
  //     fileoptionsItemList = value;
  //     ProgressDialogUtils.hideProgressDialog();
  //   });
  // }
}
