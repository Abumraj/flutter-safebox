import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/move_page_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the MovePageOneDialog.
///
/// This class manages the state of the MovePageOneDialog, including the
/// current movePageOneModelObj
class MovePageOneController extends GetxController {
  TextEditingController nameController = TextEditingController();

  Rx<MovePageOneModel> movePageOneModelObj = MovePageOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
  }
}
