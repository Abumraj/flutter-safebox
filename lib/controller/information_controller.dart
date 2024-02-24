import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/information_model.dart';

/// A controller class for the InformationBottomsheet.
///
/// This class manages the state of the InformationBottomsheet, including the
/// current informationModelObj
class InformationController extends GetxController {
  Rx<InformationModel> informationModelObj = InformationModel().obs;
}
