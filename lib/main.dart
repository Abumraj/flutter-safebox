import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/controller/notification_service.dart';
import 'package:safebox/core/service_implementation.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/presentation/splash_screen.dart';
import 'package:safebox/widgets/bad_certificate.dart';
import 'core/app_export.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> init() async {
  final AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings("@mipmap/ic_launcher");

  final DarwinInitializationSettings iOSInitializationSettings =
      DarwinInitializationSettings(
    defaultPresentAlert: false,
    defaultPresentBadge: false,
    defaultPresentSound: false,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iOSInitializationSettings,
  );

  // *** Initialize timezone here ***

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveBackgroundNotificationResponse:
        (NotificationResponse response) {},
    // onDidReceiveNotificationResponse: (NotificationResponse response) {}
    // : onSelectNotification,
  );
}

// late  SharedPreferences saveLocal;

void main() async {
  Get.put(ServiceImplementation());
  WidgetsFlutterBinding.ensureInitialized();
  Constants.initializeSharedPreferences();
  // await init();
  await PhotoManager.requestPermissionExtend();
  await FlutterContacts.requestPermission();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FileDownloader().trackTasks();
  NotificationService notificationService = NotificationService();
  // await notificationService.init();
  AccountController accountController = Get.put(AccountController());
  HttpOverrides.global = MyHttpOverrides();
  // saveLocal = await SharedPreferences.getInstance();
  bool? isLoggedIn = false;
  await Constants.getUerLoggedInSharedPreference().then((value) {
    isLoggedIn = value;
    accountController.refreshProfile();
  });
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp(
      isLoggedIn: isLoggedIn,
    ));
  });
}

class MyApp extends StatelessWidget {
  final bool? isLoggedIn;

  MyApp({super.key, this.isLoggedIn});
  final AccountController _accountController = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'safebox',
      initialBinding: InitialBindings(),
      onInit: () {
        Uploadanager.backgroundDownloaderSetup();
        if (isLoggedIn == true) {
          _accountController.refreshProfile();
        }
      },
      getPages: AppRoutes.pages,
      home: SplashScreen(isLogin: isLoggedIn.toString()),
    );
  }
}
