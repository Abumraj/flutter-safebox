import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/core/service_implementation.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/presentation/splash_screen.dart';
import 'package:safebox/widgets/bad_certificate.dart';
import 'package:another_telephony/telephony.dart';
import 'core/app_export.dart';
import 'package:permission_handler/permission_handler.dart' as p;

// import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
backgrounMessageHandler(SmsMessage message) async {
  print('New incoming message from ${message.address}');
  //Handle background message
}

final Telephony telephony = Telephony.instance;
backgroundSmsListener() {
  telephony.listenIncomingSms(
    onNewMessage: (SmsMessage message) {
      // Handle message
      print('New incoming message from ${message.address}');
    },
  );
}

// List<SmsConversation> messages = await telephony.getConversations(
// 		filter: ConversationFilter.where(ConversationColumn.MSG_COUNT)
// 					  .equals("4")
// 					  .and(ConversationColumn.THREAD_ID)
// 					  .greaterThan("12"),
// 		sortOrder: [OrderBy(ConversationColumn.THREAD_ID, sort: Sort.ASC)]
// 		);

// askForBasicPermissions() async {
//   final permissions = [
//     p.Permission.camera,
//     p.Permission.contacts,
//     p.Permission.microphone,
//     p.Permission.photos, // For Android 13+ image access
//     p.Permission.videos, // For video access (Android 13+)
//     p.Permission.audio, // For audio access (Android 13+)
//     p.Permission.storage, // For older Android versions
//   ];

//   final result = await requestPermissions(permissions);

//   if (result.values.every((status) => status.isGranted)) {
//     print("✅ All permissions granted!");
//   } else {
//     print("⚠️ Some permissions were not granted.");
//   }
// }

// /// Requests a list of permissions and returns a map of their statuses.
// Future<Map<p.Permission, p.PermissionStatus>> requestPermissions(
//   List<p.Permission> permissions,
// ) async {
//   // Check and request all at once
//   Map<p.Permission, p.PermissionStatus> statuses = await permissions.request();

//   // Optionally handle denied or permanently denied permissions
//   statuses.forEach((permission, status) {
//     if (status.isDenied) {
//       print('$permission is denied.');
//     } else if (status.isPermanentlyDenied) {
//       print('$permission is permanently denied. Please enable it in settings.');
//     } else if (status.isGranted) {
//       print('$permission is granted.');
//     }
//   });

//   return statuses;
// }

void main() async {
  Get.put(ServiceImplementation());
  WidgetsFlutterBinding.ensureInitialized();

  // HttpOverrides.global = MyHttpOverrides();
  Constants.initializeSharedPreferences();
  // await init();
  await PhotoManager.requestPermissionExtend();
  // await askForBasicPermissions();

  await FlutterContacts.requestPermission();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FileDownloader().trackTasks();
  // NotificationService notificationService = NotificationService();
  // await notificationService.init();
  HttpOverrides.global = MyHttpOverrides();
  // saveLocal = await SharedPreferences.getInstance();

  // FlutterContacts.addListener(() {
  // print("Contact changed");
  // });

  AccountController accountController = Get.put(AccountController());

  bool? isLoggedIn = false;
  await Constants.getUerLoggedInSharedPreference().then((value) {
    isLoggedIn = value;
    accountController.refreshProfile(false);
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
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'safebox',
      // initialBinding: InitialBindings(),
      onInit: () {
        Uploadanager.backgroundDownloaderSetup();
        // if (isLoggedIn == true) {
        //   _accountController.refreshProfile(false);
        // }
      },
      // getPages: AppRoutes.pages,
      home: SplashScreen(isLogin: isLoggedIn.toString()),
    );
  }
}
