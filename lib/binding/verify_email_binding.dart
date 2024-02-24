import '../controller/verify_email_controller.dart';
import 'package:get/get.dart';

/// A binding class for the VerifyEmailScreen.
///
/// This class ensures that the VerifyEmailController is created when the
/// VerifyEmailScreen is first loaded.
class VerifyEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyEmailController());
  }
}
