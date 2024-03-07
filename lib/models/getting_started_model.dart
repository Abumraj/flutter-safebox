import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';

import '../../../core/app_export.dart';
import 'fileoptions_item_model.dart';

/// This class defines the variables used in the [getting_started_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class GettingStartedModel extends GetxController {
  // final ApiRepositoryImplementation _apiRepositoryImplementation =
  //     Get.put(ApiRepositoryImplementation());
  List<FileoptionsItemModel> fileoptionsItemList = [];
  List<bool> backupOptions = [];
  Rx<bool> isSelected = false.obs;

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
