import 'package:flutter/widgets.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';

/// A controller class for the ItemOptionPageBottomsheet.
///
/// This class manages the state of the ItemOptionPageBottomsheet, including the
/// current itemOptionPageModelObj
class ItemOptionPageController extends GetxController {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  TextEditingController renameController = TextEditingController();
  Uploadanager controller = Get.put(Uploadanager());

  starFileOrFolder(
    data,
    Function reloadResource,
  ) {
    ProgressDialogUtils.showProgressDialog();
    _apiRepositoryImplementation.postStarFile(data).then((value) {
      if (value['message'] == 'Unstarred successfully') {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showSuccessToast('Unstarred successfully');
        reloadResource();
      } else if (value['message'] == 'Starred successfully') {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showSuccessToast('Starred successfully');
        reloadResource();
      } else {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showFailureToast(
            'An error occurred. please try again later.');
      }
    });
  }

  deleteFileOrFolder(data, Function reloadResource) {
    ProgressDialogUtils.showProgressDialog();
    _apiRepositoryImplementation.getDeleteFile(data).then((value) {
      if (value['message'] == 'files deleted') {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showSuccessToast('Deleted');
        reloadResource();
      } else {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showFailureToast(
            'An error occurred. please try again later.');
      }
    });
  }

  renameFileOrFolder(data, Function reloadResource) {
    ProgressDialogUtils.showProgressDialog();
    _apiRepositoryImplementation.postRenameFolder(data).then((value) {
      if (value['message'] == 'Folder renamed successfully') {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showSuccessToast('Renamed successfully');
        reloadResource();
      } else {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showFailureToast(
            'An error occurred. please try again later.');
      }
    });
  }

  moveFileOrFolder(data, Function reloadResource) {
    ProgressDialogUtils.showProgressDialog();
    _apiRepositoryImplementation.postMoveFileOrFolder(data).then((value) {
      if (value == 'Moved Successfully') {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showSuccessToast('Moved successfully');
        reloadResource();
      } else {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showFailureToast(
            'An error occurred. please try again later.');
      }
    });
  }

  copyFileOrFolder(data, Function reloadResource) {
    ProgressDialogUtils.showProgressDialog();
    _apiRepositoryImplementation.postCopyFileOrFolder(data).then((value) {
      if (value == 'Copied Successfully') {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showSuccessToast('Copied successfully');
        reloadResource();
      } else {
        ProgressDialogUtils.hideProgressDialog();
        ProgressDialogUtils.showFailureToast(
            'An error occurred. please try again later.');
      }
    });
  }

  restore(int id, String fileName) {
    ProgressDialogUtils.showProgressDialog();
    _apiRepositoryImplementation.getDownloadUrl(id).then((value) {
      ProgressDialogUtils.hideProgressDialog();
      print(value);
      controller.restoreToDevice(fileName, value);
    });
  }
}
