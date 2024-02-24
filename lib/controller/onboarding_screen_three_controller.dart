import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/onboarding_screen_three_model.dart';

/// A controller class for the OnboardingScreenThreeScreen.
///
/// This class manages the state of the OnboardingScreenThreeScreen, including the
/// current onboardingScreenThreeModelObj
class OnboardingScreenThreeController extends GetxController {
  Rx<OnboardingScreenThreeModel> onboardingScreenThreeModelObj =
      OnboardingScreenThreeModel().obs;
}
