import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/controller/notification_service.dart';
import 'package:safebox/core/service_implementation.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/presentation/splash_screen.dart';
import 'package:safebox/widgets/bad_certificate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_export.dart';
import 'package:files_uploader/files_uploader.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

late FlutterUploader uploadTracker;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void backgroundHandler() {
  WidgetsFlutterBinding.ensureInitialized();

  NotificationService notificationService = NotificationService();
  // keytool -exportcert -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore

  FlutterUploader uploader = FlutterUploader();
  SharedPreferences.getInstance().then((preferences) {
    var processed = preferences.getStringList('processed') ?? <String>[];
    if (Platform.isAndroid) {
      uploader.progress.listen((progress) {
        if (processed.contains(progress.taskId)) {
          return;
        }
        const channelId = "1";

        NotificationDetails details = NotificationDetails(
          android: AndroidNotificationDetails(
            channelId,
            "safeBOX",
            channelDescription: "Backup Notification",
            progress: progress.progress ?? 0,
            icon: 'ic_upload',
            enableVibration: false,
            importance: Importance.low,
            showProgress: true,
            onlyAlertOnce: true,
            maxProgress: 100,
            channelShowBadge: false,
          ),
          iOS: const DarwinNotificationDetails(),
        );

        notificationService.showNotification(progress.taskId.hashCode,
            "Upload Started", "Backup in Progress", details);
      });
    }

    uploader.result.listen((result) {
      if (processed.contains(result.taskId)) {
        return;
      }

      processed.add(result.taskId);
      preferences.setStringList('processed', processed);

      notificationService.cancelNotification(result.taskId.hashCode);

      final successful = result.status == UploadTaskStatus.complete;

      var title = 'Upload Completed';
      if (result.status == UploadTaskStatus.failed) {
        title = 'Upload Failed';
      } else if (result.status == UploadTaskStatus.canceled) {
        title = 'Upload Canceled';
      }
      const channelId = "1";

      notificationService
          .showNotification(
            result.taskId.hashCode,
            'Upload Status',
            title,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channelId,
                "safeBOX",
                channelDescription: "Backup Notification",
                enableVibration: !successful,
                importance: result.status == UploadTaskStatus.failed
                    ? Importance.high
                    : Importance.min,
              ),
              iOS: const DarwinNotificationDetails(
                presentAlert: true,
              ),
            ),
          )
          .catchError((e, stack) {});
    });
  });
}

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

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveBackgroundNotificationResponse:
          (NotificationResponse response) {},
      onDidReceiveNotificationResponse: (NotificationResponse response) {}
      // : onSelectNotification,
      );
}

// late  SharedPreferences saveLocal;

void main() async {
  Get.put(ServiceImplementation());
  WidgetsFlutterBinding.ensureInitialized();
  Constants.initializeSharedPreferences();
  // await init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FileDownloader().trackTasks();
  NotificationService notificationService = NotificationService();
  await notificationService.requestIOSPermissions();
  AccountController _accountController = Get.put(AccountController());
  FlutterUploader().setBackgroundHandler(backgroundHandler);
  uploadTracker = FlutterUploader();
  HttpOverrides.global = MyHttpOverrides();
  // saveLocal = await SharedPreferences.getInstance();
  bool? isLoggedIn = false;
  await Constants.getUerLoggedInSharedPreference().then((value) {
    isLoggedIn = value;
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
