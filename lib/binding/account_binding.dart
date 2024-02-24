import '../controller/account_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AccountScreen.
///
/// This class ensures that the AccountController is created when the
/// AccountScreen is first loaded.
class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}
