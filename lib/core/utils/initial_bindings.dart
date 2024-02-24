import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/data/apiClient/api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
