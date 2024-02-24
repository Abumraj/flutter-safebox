import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/getting_started_model.dart';

/// A controller class for the GettingStartedScreen.
///
/// This class manages the state of the GettingStartedScreen, including the
/// current gettingStartedModelObj
class GettingStartedController extends GetxController {
  Rx<GettingStartedModel> gettingStartedModelObj = GettingStartedModel().obs;
}
