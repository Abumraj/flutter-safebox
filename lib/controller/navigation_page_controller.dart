import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/navigation_page_model.dart';

/// A controller class for the NavigationPageScreen.
///
/// This class manages the state of the NavigationPageScreen, including the
/// current navigationPageModelObj
class NavigationPageController extends GetxController {
  Rx<NavigationPageModel> navigationPageModelObj = NavigationPageModel().obs;
}
