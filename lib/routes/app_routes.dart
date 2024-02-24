import 'package:get/get.dart';
import 'package:safebox/binding/account_binding.dart';
import 'package:safebox/binding/added_folder_binding.dart';
import 'package:safebox/binding/app_navigation_binding.dart';
import 'package:safebox/binding/change_password_binding.dart';
import 'package:safebox/binding/contact_page_binding.dart';
import 'package:safebox/binding/copy_page_binding.dart';
import 'package:safebox/binding/copy_to_my_design_binding.dart';
import 'package:safebox/binding/create_account_binding.dart';
import 'package:safebox/binding/data_selection_page_binding.dart';
import 'package:safebox/binding/files_page_binding.dart';
import 'package:safebox/binding/getting_started_binding.dart';
import 'package:safebox/binding/grid_layout_binding.dart';
import 'package:safebox/binding/home_page_binding.dart';
import 'package:safebox/binding/login_binding.dart';
import 'package:safebox/binding/move_page_binding.dart';
import 'package:safebox/binding/move_to_my_design_binding.dart';
import 'package:safebox/binding/navigation_page_binding.dart';
import 'package:safebox/binding/onboarding_screen_one_binding.dart';
import 'package:safebox/binding/onboarding_screen_three_binding.dart';
import 'package:safebox/binding/onboarding_screen_two_binding.dart';
import 'package:safebox/binding/photos_page_binding.dart';
import 'package:safebox/binding/restore_to_device_binding.dart';
import 'package:safebox/binding/settings_binding.dart';
import 'package:safebox/binding/splash_binding.dart';
import 'package:safebox/binding/starred_folder_container_binding.dart';
import 'package:safebox/binding/starred_folder_display_message_binding.dart';
import 'package:safebox/binding/storage_page_binding.dart';
import 'package:safebox/binding/storage_page_one_binding.dart';
import 'package:safebox/binding/unstarred_folder_page_display_message_binding.dart';
import 'package:safebox/binding/upgrade_storage_binding.dart';
import 'package:safebox/binding/upgrade_storage_three_binding.dart';
import 'package:safebox/binding/uploading_item_binding.dart';
import 'package:safebox/binding/uploading_item_one_binding.dart';
import 'package:safebox/binding/verify_email_binding.dart';
import 'package:safebox/binding/whatsapp_page_binding.dart';
import 'package:safebox/presentation/account_screen.dart';
import 'package:safebox/presentation/added_folder_screen.dart';
import 'package:safebox/presentation/app_navigation_screen.dart';
import 'package:safebox/presentation/change_password_screen.dart';
import 'package:safebox/presentation/contact_page_screen.dart';
import 'package:safebox/presentation/copy_page_screen.dart';
import 'package:safebox/presentation/copy_to_my_design_screen.dart';
import 'package:safebox/presentation/create_account_screen.dart';
import 'package:safebox/presentation/data_selection_page_screen.dart';
import 'package:safebox/presentation/files_page_screen.dart';
import 'package:safebox/presentation/getting_started_screen.dart';
import 'package:safebox/presentation/grid_layout_screen.dart';
import 'package:safebox/presentation/home_page_screen.dart';
import 'package:safebox/presentation/login_screen.dart';
import 'package:safebox/presentation/move_page_screen.dart';
import 'package:safebox/presentation/move_to_my_design_screen.dart';
import 'package:safebox/presentation/navigation_page_screen.dart';
import 'package:safebox/presentation/onboarding_screen_one_screen.dart';
import 'package:safebox/presentation/onboarding_screen_three_screen.dart';
import 'package:safebox/presentation/onboarding_screen_two_screen.dart';
import 'package:safebox/presentation/photos_page_screen.dart';
import 'package:safebox/presentation/restore_to_device_screen.dart';
import 'package:safebox/presentation/settings_screen.dart';
import 'package:safebox/presentation/splash_screen.dart';
import 'package:safebox/presentation/starred_folder_container_screen.dart';
import 'package:safebox/presentation/starred_folder_display_message_screen.dart';
import 'package:safebox/presentation/storage_page_one_screen.dart';
import 'package:safebox/presentation/storage_page_screen.dart';
import 'package:safebox/presentation/unstarred_folder_page_display_message_screen.dart';
import 'package:safebox/presentation/upgrade_storage_screen.dart';
import 'package:safebox/presentation/upgrade_storage_three_screen.dart';
import 'package:safebox/presentation/uploading_item_one_screen.dart';
import 'package:safebox/presentation/uploading_item_screen.dart';
import 'package:safebox/presentation/verify_email_screen.dart';
import 'package:safebox/presentation/whatsapp_page_screen.dart';

class AppRoutes {
  static const String starredFolderPage = '/starred_folder_page';

  static const String starredFolderContainerScreen =
      '/starred_folder_container_screen';

  static const String onboardingScreenOneScreen =
      '/onboarding_screen_one_screen';

  static const String onboardingScreenTwoScreen =
      '/onboarding_screen_two_screen';

  static const String onboardingScreenThreeScreen =
      '/onboarding_screen_three_screen';

  static const String splashScreen = '/splash_screen';

  static const String createAccountScreen = '/create_account_screen';

  static const String loginScreen = '/login_screen';

  static const String verifyEmailScreen = '/verify_email_screen';

  static const String gettingStartedScreen = '/getting_started_screen';

  static const String homePageScreen = '/home_page_screen';

  static const String addedFolderScreen = '/added_folder_screen';

  static const String starredFolderDisplayMessageScreen =
      '/starred_folder_display_message_screen';

  static const String unstarredFolderPageDisplayMessageScreen =
      '/unstarred_folder_page_display_message_screen';

  static const String uploadingItemOneScreen = '/uploading_item_one_screen';

  static const String uploadingItemScreen = '/uploading_item_screen';

  static const String restoreToDeviceScreen = '/restore_to_device_screen';

  static const String movePageScreen = '/move_page_screen';

  static const String copyPageScreen = '/copy_page_screen';

  static const String moveToMyDesignScreen = '/move_to_my_design_screen';

  static const String copyToMyDesignScreen = '/copy_to_my_design_screen';

  static const String gridLayoutScreen = '/grid_layout_screen';

  static const String addedFolderOnePage = '/added_folder_one_page';

  static const String filesPageScreen = '/files_page_screen';

  static const String photosPageScreen = '/photos_page_screen';

  static const String whatsappPageScreen = '/whatsapp_page_screen';

  static const String contactPageScreen = '/contact_page_screen';

  static const String navigationPageScreen = '/navigation_page_screen';

  static const String storagePageScreen = '/storage_page_screen';

  static const String storagePageOneScreen = '/storage_page_one_screen';

  static const String dataSelectionPageScreen = '/data_selection_page_screen';

  static const String starredFilesPage = '/starred_files_page';

  static const String settingsScreen = '/settings_screen';

  static const String accountScreen = '/account_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static const String upgradeStorageScreen = '/upgrade_storage_screen';

  static const String upgradeStorageThreeScreen =
      '/upgrade_storage_three_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: starredFolderContainerScreen,
      page: () => StarredFolderContainerScreen(),
      bindings: [
        StarredFolderContainerBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreenOneScreen,
      page: () => OnboardingScreenOneScreen(),
      bindings: [
        OnboardingScreenOneBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreenTwoScreen,
      page: () => OnboardingScreenTwoScreen(),
      bindings: [
        OnboardingScreenTwoBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreenThreeScreen,
      page: () => OnboardingScreenThreeScreen(),
      bindings: [
        OnboardingScreenThreeBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: createAccountScreen,
      page: () => CreateAccountScreen(),
      bindings: [
        CreateAccountBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: verifyEmailScreen,
      page: () => VerifyEmailScreen(),
      bindings: [
        VerifyEmailBinding(),
      ],
    ),
    GetPage(
      name: gettingStartedScreen,
      page: () => GettingStartedScreen(),
      bindings: [
        GettingStartedBinding(),
      ],
    ),
    GetPage(
      name: homePageScreen,
      page: () => HomePageScreen(),
      bindings: [
        HomePageBinding(),
      ],
    ),
    GetPage(
      name: addedFolderScreen,
      page: () => AddedFolderScreen(),
      bindings: [
        AddedFolderBinding(),
      ],
    ),
    GetPage(
      name: starredFolderDisplayMessageScreen,
      page: () => StarredFolderDisplayMessageScreen(),
      bindings: [
        StarredFolderDisplayMessageBinding(),
      ],
    ),
    GetPage(
      name: unstarredFolderPageDisplayMessageScreen,
      page: () => UnstarredFolderPageDisplayMessageScreen(),
      bindings: [
        UnstarredFolderPageDisplayMessageBinding(),
      ],
    ),
    GetPage(
      name: uploadingItemOneScreen,
      page: () => UploadingItemOneScreen(),
      bindings: [
        UploadingItemOneBinding(),
      ],
    ),
    GetPage(
      name: uploadingItemScreen,
      page: () => UploadingItemScreen(),
      bindings: [
        UploadingItemBinding(),
      ],
    ),
    GetPage(
      name: restoreToDeviceScreen,
      page: () => RestoreToDeviceScreen(),
      bindings: [
        RestoreToDeviceBinding(),
      ],
    ),
    GetPage(
      name: movePageScreen,
      page: () => MovePageScreen(),
      bindings: [
        MovePageBinding(),
      ],
    ),
    GetPage(
      name: copyPageScreen,
      page: () => CopyPageScreen(),
      bindings: [
        CopyPageBinding(),
      ],
    ),
    GetPage(
      name: copyToMyDesignScreen,
      page: () => CopyToMyDesignScreen(),
      bindings: [
        CopyToMyDesignBinding(),
      ],
    ),
    GetPage(
      name: gridLayoutScreen,
      page: () => GridLayoutScreen(),
      bindings: [
        GridLayoutBinding(),
      ],
    ),
    // GetPage(
    //   name: filesPageScreen,
    //   page: () => FilesPageScreen(),
    //   bindings: [
    //     FilesPageBinding(),
    //   ],
    // ),
    GetPage(
      name: photosPageScreen,
      page: () => PhotosPageScreen(),
      bindings: [
        PhotosPageBinding(),
      ],
    ),
    GetPage(
      name: whatsappPageScreen,
      page: () => WhatsappPageScreen(),
      bindings: [
        WhatsappPageBinding(),
      ],
    ),
    GetPage(
      name: contactPageScreen,
      page: () => ContactPageScreen(),
      bindings: [
        ContactPageBinding(),
      ],
    ),
    GetPage(
      name: navigationPageScreen,
      page: () => NavigationPageScreen(),
      bindings: [
        NavigationPageBinding(),
      ],
    ),
    GetPage(
      name: storagePageScreen,
      page: () => StoragePageScreen(),
      bindings: [
        StoragePageBinding(),
      ],
    ),
    GetPage(
      name: storagePageOneScreen,
      page: () => StoragePageOneScreen(),
      bindings: [
        StoragePageOneBinding(),
      ],
    ),
    GetPage(
      name: dataSelectionPageScreen,
      page: () => DataSelectionPageScreen(),
      bindings: [
        DataSelectionPageBinding(),
      ],
    ),
    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
      bindings: [
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: accountScreen,
      page: () => AccountScreen(),
      bindings: [
        AccountBinding(),
      ],
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => ChangePasswordScreen(),
      bindings: [
        ChangePasswordBinding(),
      ],
    ),
    GetPage(
      name: upgradeStorageScreen,
      page: () => UpgradeStorageScreen(),
      bindings: [
        UpgradeStorageBinding(),
      ],
    ),
    GetPage(
      name: upgradeStorageThreeScreen,
      page: () => UpgradeStorageThreeScreen(),
      bindings: [
        UpgradeStorageThreeBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => StarredFolderContainerScreen(),
      bindings: [
        StarredFolderContainerBinding(),
      ],
    )
  ];
}
