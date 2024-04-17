// import 'package:safebox/controller/name_folder_page_controller.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/presentation/home_page_screen.dart';

class StarredFolderController extends GetxController {
  TextEditingController searchController = TextEditingController();
  TextEditingController folderNameController = TextEditingController();
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  Rx<List<UserfilesItemModel>> starredFolderModelObj = Rx([]);
  Rx<UserfilesItemModel> starredObj = UserfilesItemModel().obs;
  Rx<bool> createFolder = false.obs;

  Rx<bool> uploadFiles = false.obs;

  Rx<bool> uploadPhotosAndVideos = false.obs;

  Rx<bool> uploadContacts = false.obs;

  Rx<bool> scanDocument = false.obs;
  Rx<bool> isGridView = false.obs;

  Rx<bool> uploadAudio = false.obs;

  Rx<bool> uploadWhatsappBackup = false.obs;
  Rx<bool> canLoadMore = false.obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    // recentFiles();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  sortAscending() {
    starredFolderModelObj.value
        .sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
  }

  sortBySizeAscending() {
    starredFolderModelObj.value.sort((a, b) =>
        ProgressDialogUtils.getSizeComparableValue(b.size) -
        ProgressDialogUtils.getSizeComparableValue(a.size));
  }

  sortdescending() {
    starredFolderModelObj.value
        .sort((a, b) => (b.name ?? '').compareTo(a.name ?? ''));
  }

  sortByDatedescending() {
    starredFolderModelObj.value.sort((a, b) =>
        (b.updatedAt ?? DateTime(0)).compareTo(a.updatedAt ?? DateTime(0)));
  }

  sortBySizedescending() {
    starredFolderModelObj.value.sort((a, b) =>
        ProgressDialogUtils.getSizeComparableValue(a.size) -
        ProgressDialogUtils.getSizeComparableValue(b.size));
  }

  void listGrid() {
    isGridView.value = !isGridView.value;
  }
//   void recentFiles() {
// isLoading  =  true.obs;
//     _apiRepositoryImplementation.getRecentFiles().then((value) {
//       List<UserfilesItemModel> list = parsedFileList(value.data['data']);
//       starredFolderModelObj.value = list; // Assign the new list directly
//       canLoadMore.value = value.data['links']['next'] != null;
//      isLoading = false.obs;
//       // Trigger the reactivity system to update the UI
//       update();
//     });
//   }

  static List<UserfilesItemModel> parsedFileList(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed
        .map<UserfilesItemModel>((json) => UserfilesItemModel.fromJson(json))
        .toList();
  }

  createFolderInCloud() {
    var data = {
      'name': folderNameController.text,
    };
    ProgressDialogUtils.showProgressDialog();
    _apiRepositoryImplementation.postCreateFolder(data).then((value) {
      if (value['message'] == 'Folder created successfully') {
        ProgressDialogUtils.showSuccessToast('Folder created successfully');
        ProgressDialogUtils.hideProgressDialog();
      } else {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showFailureToast(
            'An error occurred. please try again later.');
      }
      Get.off(const HomePageScreen());
    });
  }

  Future createSubFolderInCloud(folderId) async {
    var data = {
      'parent_id': folderId,
      'name': folderNameController.text,
    };
    ProgressDialogUtils.showProgressDialog();
    await _apiRepositoryImplementation.postCreateFolder(data).then((value) {
      if (value['message'] == 'Folder created successfully') {
        ProgressDialogUtils.showSuccessToast('Folder created successfully');
        ProgressDialogUtils.hideProgressDialog();
      } else {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showFailureToast(
            'An error occurred. please try again later.');
      }
      // Get.off(const HomePageScreen());
    });
  }
}
