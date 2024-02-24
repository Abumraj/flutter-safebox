import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/splash_model.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  reidrectToOnboardOrHome() {}
}
