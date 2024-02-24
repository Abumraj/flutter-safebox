import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/onboarding_screen_two_model.dart';

/// A controller class for the OnboardingScreenTwoScreen.
///
/// This class manages the state of the OnboardingScreenTwoScreen, including the
/// current onboardingScreenTwoModelObj
class OnboardingScreenTwoController extends GetxController {
  Rx<OnboardingScreenTwoModel> onboardingScreenTwoModelObj =
      OnboardingScreenTwoModel().obs;
}
