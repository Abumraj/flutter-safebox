import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:disk_space_update/disk_space_update.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:safebox/controller/account_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:safebox/presentation/upgrade_plan_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = 'https://safebox.africa/api/file';
// String baseUrl = 'http://192.168.43.144/api/file';

class Uploadanager extends GetxController {
  final AccountController accountController = Get.put(AccountController());

  List<AssetEntity> mediaAssets = [];
  Rx<double> progressUpdate = 0.0.obs;
  int totalUploadSize = 0;
  Rx<int> totalUploadLength = 0.obs;
  int totalUploadCount = 0;
  Rx<int> totalProgressSize = 0.obs;
  int totalbatchSize = 1;
  int chunkSizeUpdate = 0;
  String backUpDateKey = '';
  DateTime? backUpDate;
  String backUpDateString = '';
  String appDir = '';
// List<DownloadTask> recoveryTask = [];
  static late MultiUploadTask backupTask;
  Rx<bool> isUploadStarted = false.obs;
  Rx<bool> isPreparingBackUp = false.obs;
  Rx<TaskRecord>? trackRecord;
  resetProgress() {
    progressUpdate.value = 0.0;
    totalUploadSize = 0;
    totalProgressSize.value = 0;
  }

  Future docsUpload({int? folderId, Function? callBack}) async {
    final files = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        // initialDirectory: ,
        allowCompression: false,
        allowMultiple: true,
        allowedExtensions: [
          'pdf',
          'docx',
          'doc',
          'xlsx',
          'xls',
          'csv',
          'ods',
          'pptx',
          'ppt',
          'odt'
        ]);

    if (files != null && files.count > 0) {
      totalUploadSize = 0;
      Constants.getUserTokenSharedPreference().then(
        (value) {
          String token = value.toString();
          List<String?> filer = [];

          for (var file in files.files) {
            filer.add(file.name);
            totalUploadSize += file.size;
          }

          if (filer.isNotEmpty) {
            _uploadFile(
                true, "file_picker", filer, token, folderId, 'file', callBack);
          }
        },
      );
      // if (binary) {

      // } else {
      // _handleFileUpload(files.paths, folderId);
      // }
    }
  }

  Future photoUpload({int? folderId, Function? callBack}) async {
    final files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      // initialDirectory: ,
      allowCompression: false,
      allowMultiple: true,
    );

    if (files != null && files.count > 0) {
      totalUploadSize = 0;
      Constants.getUserTokenSharedPreference().then(
        (value) {
          String token = value.toString();
          List<String?> filer = [];

          for (var file in files.files) {
            filer.add(file.name);
            totalUploadSize += file.size;
          }

          if (filer.isNotEmpty) {
            _uploadFile(
                true, "file_picker", filer, token, folderId, 'photo', callBack);
          }
        },
      );
      // if (binary) {

      // } else {
      // _handleFileUpload(files.paths, folderId);
      // }
    }
  }

  Future videoUpload({int? folderId, Function? callBack}) async {
    final files = await FilePicker.platform.pickFiles(
      type: FileType.video,
      // initialDirectory: ,
      allowCompression: false,
      allowMultiple: true,
    );

    if (files != null && files.count > 0) {
      totalUploadSize = 0;
      Constants.getUserTokenSharedPreference().then(
        (value) {
          String token = value.toString();
          List<String?> filer = [];

          for (var file in files.files) {
            filer.add(file.name);
            totalUploadSize += file.size;
          }

          if (filer.isNotEmpty) {
            _uploadFile(
                true, "file_picker", filer, token, folderId, 'video', callBack);
          }
        },
      );
      // if (binary) {

      // } else {
      // _handleFileUpload(files.paths, folderId);
      // }
    }
  }

  Future audioUpload({int? folderId, Function? callBack}) async {
    final files = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      // initialDirectory: ,
      allowCompression: false,
      allowMultiple: true,
    );

    if (files != null && files.count > 0) {
      totalUploadSize = 0;
      Constants.getUserTokenSharedPreference().then(
        (value) {
          String token = value.toString();
          List<String?> filer = [];

          for (var file in files.files) {
            filer.add(file.name);
            totalUploadSize += file.size;
          }

          if (filer.isNotEmpty) {
            _uploadFile(
                true, "file_picker", filer, token, folderId, 'audio', callBack);
          }
        },
      );
      // if (binary) {

      // } else {
      // _handleFileUpload(files.paths, folderId);
      // }
    }
  }

  Future whatsappUpload({int? folderId, Function? callBack}) async {
    final files = await FilePicker.platform.pickFiles(
      // type: FileType.custom,
      // initialDirectory: ,
      allowCompression: false,
      allowMultiple: true,
      // allowedExtensions: ["db"]
    );

    if (files != null && files.count > 0) {
      totalUploadSize = 0;
      Constants.getUserTokenSharedPreference().then(
        (value) {
          String token = value.toString();
          List<String?> filer = [];

          for (var file in files.files) {
            if (file.extension!.contains('crypt')) {
              filer.add(file.name);
              totalUploadSize += file.size;
            } else {
              ProgressDialogUtils.showFailureToast(
                  "File is not a whatsapp file");
            }
            // print(file.extension);
          }

          // _handleFileUpload(filer, folderId, token);
          // print(filer.length);
          // print( ProgressDialogUtils.formatFileSize(totalUploadSize.value));

          if (filer.isNotEmpty) {
            _uploadFile(true, "file_picker", filer, token, folderId, 'whatsapp',
                callBack);
          }
        },
      );
      // if (binary) {

      // } else {
      // _handleFileUpload(files.paths, folderId);
      // }
    }
  }

  static backgroundDownloaderSetup() {
    void myNotificationTapCallback(
        Task task, NotificationType notificationType) {
      debugPrint(
          'Tapped notification $notificationType for taskId ${task.taskId}');
    }

    FileDownloader().configure(globalConfig: [
      (Config.requestTimeout, const Duration(seconds: 100)),
    ], androidConfig: [
      (Config.useExternalStorage, Config.always),
    ], iOSConfig: [
      (Config.localize, {'Cancel': 'StopIt'}),
    ]).then((result) => debugPrint('Configuration result = $result'));
    FileDownloader()
        .registerCallbacks(
            taskNotificationTapCallback: myNotificationTapCallback)
        .configureNotificationForGroup(FileDownloader.defaultGroup,
            // For the main download button
            // which uses 'enqueue' and a default group
            running: const TaskNotification('Backup {filename}',
                'File: {filename} - {progress} - speed {networkSpeed} and {timeRemaining} remaining'),
            complete: const TaskNotification(
                '{displayName} download {numTotal}', 'Backup complete'),
            error: const TaskNotification('Backup {filename}', 'Backup failed'),
            paused: const TaskNotification(
                'Backup {filename}', 'Paused with metadata {metadata}'),
            progressBar: true)
        .configureNotificationForGroup(
          'bunch',
          running: const TaskNotification(
              '{numFinished} out of {numTotal}', 'Progress = {progress}'),
          complete: const TaskNotification("Done!", "Loaded {numTotal} files"),
          error:
              const TaskNotification('Error', '{numFailed}/{numTotal} failed'),
          progressBar: false,
        )
        .configureNotification(
            complete: const TaskNotification('Backup Completed', ''),
            running: const TaskNotification('Processing files', '{progress}'),
            progressBar: true,
            tapOpensFile: false);
  }

  Future<List<Contact>> extractContact() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    List<Contact> recoveredContacts = [];
    File importedContact = File("${appDir.path}/contacts.vcf");

    if (importedContact.existsSync()) {
      var vCardContacts = await importedContact.readAsString();
      var lines = vCardContacts.split('\n');
      var vCardData = '';

      for (var line in lines) {
        if (line.startsWith('BEGIN:VCARD')) {
          vCardData = '';
        }
        vCardData += '$line\n';
        if (line.startsWith('END:VCARD')) {
          Contact contact = Contact.fromVCard(vCardData);
          if (contact.displayName.toString() != 'null') {
            // print(contact.displayName.toString());
            recoveredContacts.add(contact);
          }
        }
      }
    }
    return recoveredContacts;
  }

  extractContact1(File importedContact) async {
    // Directory appDir = await getApplicationDocumentsDirectory();

    // List<Contact> recoveredContacts = [];
    // File importedContact = File("${appDir.path}/contacts.vcf");

    if (importedContact.existsSync()) {
      var vCardContacts = await importedContact.readAsString();
      var lines = vCardContacts.split('\n');
      var vCardData = '';
      List<String> vCardList = [];

      for (var line in lines) {
        if (line.startsWith('BEGIN:VCARD')) {
          vCardData = '';
        }
        vCardData += '$line\n';
        if (line.startsWith('END:VCARD')) {
          vCardList.add(vCardData);

          // Contact contact = Contact.fromVCard(vCardData);
          // if (contact.displayName.toString() != 'null') {
          //   // print(contact.displayName.toString());
          //   recoveredContacts.add(contact);
          // }
        }
      }
      await saveUploadedContactsToPrefs(vCardList);
      List<Contact> contacts = convertVcardToContactList(vCardList);
      restoreContact(contacts);
    }
    // for (var contact in recoveredContacts) {
    //   String vCard = contact.toVCard();
    // }
  }

  List<Contact> convertVcardToContactList(vCardContacts) {
    List<String> vCardList = vCardContacts;

    List<Contact> recoveredContacts = [];
    for (var element in vCardList) {
      Contact contact = Contact.fromVCard(element);
      // print(contact.phones.first.number);
      recoveredContacts.add(contact);
    }
    return recoveredContacts;
  }

  void uploadContact(List<Contact> contacts, {Function? callBack}) async {
    totalUploadSize = 0;
    List<Contact> preContact = [];
    await extractContact().then((value) async {
      print(value.isNotEmpty);
      if (value.isNotEmpty) {
        preContact.addAll(value);
      }
      preContact.addAll(contacts);
      print(preContact.length);
      // List<Contacts> contactToUpload = [];
      // Combine vCard data into a single string
      List<String> vCardList = [];

      for (var contact in preContact) {
        String vCard = contact.toVCard();
        vCardList.add(vCard);
      }
      String combinedVCardData = vCardList.join('\n');
      Directory appDir = await getApplicationDocumentsDirectory();
      File file = File('${appDir.path}/contacts.vcf');
      file = await file.writeAsString(combinedVCardData);
      file = File('${appDir.path}/contacts.vcf');

      totalUploadSize = file.lengthSync();
      Constants.getUserTokenSharedPreference().then((value) {
        _uploadFile(false, "", [(file.path)], value.toString(), "folderId",
            "contact", callBack);
      });
    });

    // } else {
  }

  backUpContact() async {
    List<String> vcardcontacts = await getContactsFromPrefs();
    List<Contact> contacts = convertVcardToContactList(vcardcontacts);
    uploadContact(contacts);
  }

  Future<String> selectDirectory() async {
    String? restoreLocation = await FilePicker.platform.getDirectoryPath();
    return restoreLocation!;
  }

  restoreToDevice(fileName, url) async {
    if (fileName.endsWith(".vcf")) {
      await downloadFile(fileName, url, "value");
    } else {
      ProgressDialogUtils.showSuccessToast(
          "Select Location to store your file");
      selectDirectory().then((value) async {
        await downloadFile(fileName, url, value);
      });
    }
  }
//   wa.db.crypt14
// I/flutter ( 2735): https://safebox.africa/storage/pqeeS9I2HVjfdWoNdUkFPfY0ynJngbXMP2Yh4Jkf.tfm
// I/flutter ( 2735): /storage/emulated/0/Download

  downloadFile(
    fileName,
    url,
    restoreLocation,
  ) async {
    try {
      DownloadTask task = DownloadTask(
          url: url,
          filename: fileName,
          // directory: restoreLocation,
          updates: Updates.statusAndProgress,
          requiresWiFi: false,
          retries: 5,
          allowPause: false,
          // baseDirectory: BaseDirectory.temporary,
          httpRequestMethod: 'GET',
          metaData: 'Restore to device');
      ProgressDialogUtils.showSuccessToast("Download Started");

      await FileDownloader().download(
        task,
        onProgress: (value) {
          if (!value.isNegative) {
            // print(value);
          }
          if (value == 1.0) {
            ProgressDialogUtils.showSuccessToast("Downloaded Successfully");
            // FileDownloader().moveToSharedStorage(
            //   task, SharedStorage.downloads,
            //   // directory: restoreLocation
            // );
            // String downloadFilePath = '';
            // task.filePath().then((value) {
            //   print(value);
            //   // downloadFilePath = value;
            // });
            checkFileExist(fileName, Directory(restoreLocation).path);
            // moveFile(
            //     "/storage/emulated/0/Android/data/com.example.safebox/files/hangouts_message.ogg",
            //     restoreLocation);
            // filePath = Directory(SharedStorage.downloads)
            // .rename(Directory(restoreLocation).path);
          }
        },
        onStatus: (status) {},
      );
    } catch (e) {
      print(e);
      return e;
    }
  }

  checkFileExist(filename, destination) async {
    Directory? filePath = await getExternalStorageDirectory();
    print(filePath!.path);
    File sourceFile = File("${filePath.path}/$filename");
    if (sourceFile.existsSync()) {
      if (filename.endsWith(".vcf")) {
        // Directory appDir = await getApplicationDocumentsDirectory();
        // File file = File('${appDir.path}/contacts.vcf');
        // // moveFile(sourceFile.path, "$destination/$filename");
        // await sourceFile.copy(file.path);
        await extractContact1(sourceFile);
        // sourceFile.delete();

        print("File is a VCF file");
      } else if (filename.endsWith(".zip")) {
        ProgressDialogUtils.showSuccessToast("Extracting Whatsapp files");
        await ZipFile.extractToDirectory(
            zipFile: sourceFile, destinationDir: Directory(destination));
        ProgressDialogUtils.showSuccessToast("Extraction Complete");
        print("File is a ZIP file");
      } else {
        moveFile(sourceFile.path, "$destination/$filename");
        print("File is neither VCF nor ZIP");
      }
    }
    // return filePath!.path;
  }

  void moveFile(String sourcePath, String destinationPath) {
    try {
      // Create a File object for the source file
      File sourceFile = File(sourcePath);

      // Check if the source file exists
      if (sourceFile.existsSync()) {
        // Create a File object for the destination file
        File destinationFile = File(destinationPath);

        // Move the file to the destination directory
        sourceFile.renameSync(destinationFile.path);
        print('File moved successfully.');
      } else {
        print('Source file does not exist.');
      }
    } catch (e) {
      print('Error moving file: $e');
      // Handle the error here (e.g., show an error message to the user)
    }
  }

  // Future<File> moveFile(File sourceFile, String newPath) async {
  //   try {
  //     // prefer using rename as it is probably faster
  //     return await sourceFile.rename(newPath);
  //   } on FileSystemException catch (e) {
  //     // if rename fails, copy the source file and then delete it
  //     final newFile = await sourceFile.copy(newPath);
  //     await sourceFile.delete();
  //     return newFile;
  //   }
  // }

  _uploadFile(isTemp, directory, files, token, folderId, productId,
      Function? callBack) async {
    if ((ProgressDialogUtils.getSizeComparableValue(
                    accountController.accountModelObj.value.usedStorage) +
                totalUploadSize) ==
            ProgressDialogUtils.getSizeComparableValue(
                accountController.accountModelObj.value.totalStorage) ||
        (ProgressDialogUtils.getSizeComparableValue(
                    accountController.accountModelObj.value.usedStorage) +
                totalUploadSize) >
            ProgressDialogUtils.getSizeComparableValue(
                accountController.accountModelObj.value.totalStorage)) {
      Get.dialog(const AlertDialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        content: UpgradePlanDialog(),
      ));
    } else {
      try {
        MultiUploadTask task = MultiUploadTask(
            url: baseUrl,
            files: files,
            fields: folderId == null
                ? {"productId": productId}
                : {"parent_id": folderId.toString(), "productId": productId},
            updates: Updates.statusAndProgress,
            requiresWiFi: false,
            retries: 5,
            httpRequestMethod: 'POST',
            directory: directory,
            baseDirectory: isTemp
                ? BaseDirectory.temporary
                : BaseDirectory.applicationDocuments,
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token'
            });

        await FileDownloader().upload(
          task,
          onProgress: (progress) {
            progressUpdate.value = progress * 100;

            if (progressUpdate.value == 100 && totalbatchSize > 1) {
              if (totalUploadCount > totalUploadLength.value) {
                totalUploadLength.value += chunkSizeUpdate;
              }
            }
          },
          onStatus: (status) {
            // trckUploadProgress(task.taskId);
            // print(status);
            // if () {

            // }
          },
        );
        // result.
        if (progressUpdate.value == 100 && totalbatchSize == 1) {
          accountController.refreshProfile(true);
          ProgressDialogUtils.showSuccessToast("Uploaded successfully");
        }
        if (progressUpdate.value == 100 && totalbatchSize > 1) {
          if (totalUploadCount > totalUploadSize ||
              totalUploadCount == totalUploadSize) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(backUpDateKey, backUpDateString);
          }
          accountController.refreshProfile(true);
          ProgressDialogUtils.showSuccessToast("Backed up successfully");
        }
        if (callBack != null) {
          callBack();
        }
      } catch (e) {
        return e;
      }
    }
  }

  Future<DirStat> getDirStat(String dirPath) async {
    var dir = Directory(dirPath);
    bool exists = await dir.exists();
    if (!exists) {
      return DirStat(numberOfFiles: 0, totalSize: 0);
    }

    int numberOfFiles = 0;
    int totalSize = 0;
    await dir
        .list(recursive: true, followLinks: false)
        .forEach((FileSystemEntity entity) async {
      if (entity is File) {
        numberOfFiles++;
        totalSize += entity.lengthSync();
      }
    });
    return DirStat(numberOfFiles: numberOfFiles, totalSize: totalSize);
  }

  Future<int> getAvailableSpace() async {
    try {
      // Get the directory for the external storage (SD card)
      Directory? externalDir = await getExternalStorageDirectory();
      if (externalDir != null) {
        // Get the available space on the external storage
        FileSystemEntity entity = File('/storage/emulated/0/WhatsApp Business');
        FileStat stat = await entity.stat();
        print(stat.size);
        return stat.size;
      } else {
        // External storage directory is not available
        return -1;
      }
    } catch (e) {
      // Error occurred while getting available space
      print('Error getting available space: $e');
      return -1;
    }
  }

  backupWhatsapp() async {
    isPreparingBackUp.value = true;

    double diskSpace = 0;

    diskSpace = await DiskSpace.getFreeDiskSpace ?? 0;
    print(diskSpace);
    // // FilePicker.platform.getDirectoryPath().then((value) => print(value));

    whatsappDirectoryLookup().then((value) {
      value.forEach((element) async {
        DirStat stats = await getDirStat(element.path);
        String link = element.path;

        List<String> parts = link.split('/');
        String lastWord = parts.isNotEmpty ? parts.last : '';
        if (diskSpace > (stats.totalSize / 1024 * 1024)) {
          await _testZip(element, lastWord).then((value) async {
            File zip = value;
            //  _uploadFile(true, "file_picker", filer, token, folderId, 'whatsapp',
            //       callBack);
            await Constants.getUserTokenSharedPreference().then(
              (value) {
                isPreparingBackUp.value = false;

                String token = value.toString();

                _uploadFile(true, "", zip.path, token, '', "whatsapp", null);
              },
            );
          });
          _deleteZipFile("$appDir/$lastWord.zip");
        } else {
          ProgressDialogUtils.showFailureToast(
              "You don't have enough storage to backup Whatsapp");
        }
      });
    });
  }

  Future<File> _testZip(storeDir, filename) async {
    final zipFile = _createZipFile("$filename.zip");
    print("Writing to zip file: ${zipFile.path}");

    // int onProgressCallCount1 = 0;

    try {
      await ZipFile.createFromDirectory(
        sourceDir: storeDir,
        zipFile: zipFile,
        recurseSubDirs: true,
        // includeBaseDirectory: true,
        onZipping: (fileName, isDirectory, progress) {
          // ++onProgressCallCount1;
          print('Zip #1:');
          print('progress: ${progress.toStringAsFixed(1)}%');
          print('name: $fileName');
          print('isDirectory: $isDirectory');
          return ZipFileOperation.includeItem;
        },
      );
    } on PlatformException catch (e) {
      print(e);
    }
    return zipFile;
  }

  File _createZipFile(String fileName) {
    final zipFilePath = "$appDir/$fileName";
    final zipFile = File(zipFilePath);

    if (zipFile.existsSync()) {
      print("Deleting existing zip file: ${zipFile.path}");
      zipFile.deleteSync();
    }
    return zipFile;
  }

  _deleteZipFile(String fileName) {
    final zipFilePath = "$appDir/$fileName";
    final zipFile = File(zipFilePath);

    if (zipFile.existsSync()) {
      print("Deleting existing zip file: ${zipFile.path}");
      zipFile.deleteSync(recursive: true);
    }
    return zipFile;
  }

  restoreContact(List<Contact> contacts) async {
    ProgressDialogUtils.showSuccessToast("Inserting contacts into phone");
    for (var contact in contacts) {
      await FlutterContacts.insertContact(contact);
    }
    ProgressDialogUtils.showSuccessToast(
        "Contacts Restored to device successfully");
  }

  backupContact() async {
    Iterable<Contact> allContacts =
        await FlutterContacts.getContacts(withProperties: true);
    if (allContacts.isNotEmpty) {
      // Create a list of vCard data
      List<String> vCardList = [];
      //  FlutterContacts.insertContact(contact)
      // Convert FlutterContact objects to vCard data
      for (var contact in allContacts) {
        String vCard = contact.toVCard();
        vCardList.add(vCard);
      }
      // Combine vCard data into a single string
      String combinedVCardData = vCardList.join('\n');
      Directory appDir = await getApplicationDocumentsDirectory();
      File file = File('${appDir.path}/contacts.vcf');
      file = await file.writeAsString(combinedVCardData);
      // _uploadBackupFile(file, token, folderId, productId);
    }
  }

  Future<List<Directory>> whatsappDirectoryLookup() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    appDir = appDocDir.path;

    List<Directory> whatsappDirectory = [];

    try {
      String whatsappPathOnLowerAndroidVersion =
          '/storage/emulated/0/Android/media/com.whatsApp';
      String whatsappBusinessPathOnLowerAndroidVersion =
          '/storage/emulated/0/Android/media/com.whatsApp.w4b';
      String whatsappPathOnHigherAndroidVersion =
          '/storage/emulated/0/WhatsApp';
      String whatsappBusinessPathOnHigherAndroidVersion =
          '/storage/emulated/0/WhatsApp Business';

      // Check for the WhatsApp directory

      // For lower Android versions, check WhatsApp directory first
      if (Directory(whatsappPathOnLowerAndroidVersion).existsSync() &&
          Directory(whatsappPathOnLowerAndroidVersion).listSync().isNotEmpty) {
        whatsappDirectory.add(Directory(whatsappPathOnLowerAndroidVersion));
      }
      if (Directory(whatsappBusinessPathOnLowerAndroidVersion).existsSync() &&
          Directory(whatsappBusinessPathOnLowerAndroidVersion)
              .listSync()
              .isNotEmpty) {
        whatsappDirectory
            .add(Directory(whatsappBusinessPathOnLowerAndroidVersion));
      }
      // For higher Android versions, check WhatsApp Business directory first
      if (Directory(whatsappBusinessPathOnHigherAndroidVersion).existsSync() &&
          Directory(whatsappBusinessPathOnHigherAndroidVersion)
              .listSync()
              .isNotEmpty) {
        whatsappDirectory
            .add(Directory(whatsappBusinessPathOnHigherAndroidVersion));
      }

      if (Directory(whatsappPathOnHigherAndroidVersion).existsSync() &&
          Directory(whatsappPathOnHigherAndroidVersion).listSync().isNotEmpty) {
        whatsappDirectory.add(Directory(whatsappPathOnHigherAndroidVersion));
      }

      if (whatsappDirectory.isEmpty) {
        throw Exception('WhatsApp directory not found');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
      return [];
    }

    return whatsappDirectory;
  }

  Future<void> photosBackUp() async {
    isPreparingBackUp.value = true;

    backUpDateKey = 'photo_last_backup_date';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastBackupDateString = prefs.getString('photo_last_backup_date');

    if (lastBackupDateString != null) {
      backUpDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').parse(lastBackupDateString);
    }

    int imageChunkSize = 10;
    totalUploadSize = 0;
    List<String> filePaths = [];
    List<AssetPathEntity> media = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      // filterOption: FilterOptionGroup(imageOption: )
    );
    backUpDateString = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    for (var path in media) {
      List<AssetEntity> assets =
          await path.getAssetListPaged(page: 0, size: 5000);
      // mediaAssets.addAll(assets);

      for (var element in assets) {
        if (backUpDate == null || element.createDateTime.isAfter(backUpDate!)) {
          // Get the file size asynchronously
          int fileSize = await (await element.file)!.length();
          totalUploadSize += fileSize;

          // Get the file path
          String path = (await element.file)!.path;
          filePaths.add(path);
        }
      }

      // element.file.then(
      //   (value) => value!.length().then((value) => totalUploadSize += value),
      // );
      //     int fileSize = await (await element.file)!.length();
      //     totalUploadSize += fileSize;
      //     print(
      //       totalUploadSize,
      //     );
      //     // totalUploadSize += element.size as num;
      //     // element.file.then((value) {
      //     //   filePaths.add(value!.path);
      //     // });
      //     String path = (await element.file)!.path;
      //     filePaths.add(path);
      //   }
      // }
      totalUploadCount = filePaths.length;
      // for (var i = 0
      //; i < count; i++) {}
    }
    print(filePaths.length);
    isPreparingBackUp.value = false;

    uploadByChunks(filePaths, imageChunkSize, 'photo');
  }

  Future<void> audioBackUp() async {
    isPreparingBackUp.value = true;
    backUpDateKey = 'audio_last_backup_date';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastBackupDateString = prefs.getString('audio_last_backup_date');

    if (lastBackupDateString != null) {
      backUpDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').parse(lastBackupDateString);
    }

    int imageChunkSize = 10;
    totalUploadSize = 0;

    List<String> filePaths = [];
    List<AssetPathEntity> media = await PhotoManager.getAssetPathList(
      type: RequestType.audio,
      // filterOption: FilterOptionGroup(imageOption: )
    );
    backUpDateString = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    for (var path in media) {
      List<AssetEntity> assets =
          await path.getAssetListPaged(page: 0, size: 5000);
      // mediaAssets.addAll(assets);

      for (var element in assets) {
        if (backUpDate == null || element.createDateTime.isAfter(backUpDate!)) {
          // Get the file size asynchronously
          int fileSize = await (await element.file)!.length();
          totalUploadSize += fileSize;

          // Get the file path
          String path = (await element.file)!.path;
          filePaths.add(path);
        }
      }
      // element.file.then(
      //   (value) => value!.length().then((value) => totalUploadSize += value),
      // );
      //     int fileSize = await (await element.file)!.length();
      //     totalUploadSize += fileSize;
      //     print(
      //       totalUploadSize,
      //     );
      //     // totalUploadSize += element.size as num;
      //     // element.file.then((value) {
      //     //   filePaths.add(value!.path);
      //     // });
      //     String path = (await element.file)!.path;
      //     filePaths.add(path);
      //     // print(filePath.length);
      //   }
      // }

      // for (var i = 0; i < count; i++) {}
    }
    print(filePaths.length);

    totalUploadCount = filePaths.length;
    isPreparingBackUp.value = false;

    uploadByChunks(filePaths, imageChunkSize, 'audio');
  }

  Future<void> videosBackUp() async {
    isPreparingBackUp.value = true;

    backUpDateKey = 'video_last_backup_date';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastBackupDateString = prefs.getString('video_last_backup_date');

    if (lastBackupDateString != null) {
      backUpDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').parse(lastBackupDateString);
    }

    int imageChunkSize = 3;
    List<String> filePaths = [];
    totalUploadSize = 0;

    List<AssetPathEntity> media = await PhotoManager.getAssetPathList(
      type: RequestType.video,
      // filterOption: FilterOptionGroup(imageOption: )
    );
    backUpDateString = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    for (var path in media) {
      List<AssetEntity> assets =
          await path.getAssetListPaged(page: 0, size: 5000);
      // mediaAssets.addAll(assets);

      for (var element in assets) {
        if (backUpDate == null || element.createDateTime.isAfter(backUpDate!)) {
          // Get the file size asynchronously
          int fileSize = await (await element.file)!.length();
          totalUploadSize += fileSize;

          // Get the file path
          String path = (await element.file)!.path;
          filePaths.add(path);
        }
      }
      // element.file.then(
      //   (value) => value!.length().then((value) => totalUploadSize += value),
      // );
      //     int fileSize = await (await element.file)!.length();
      //     totalUploadSize += fileSize;
      //     print(
      //       totalUploadSize,
      //     );
      //     // totalUploadSize += element.size as num;
      //     // element.file.then((value) {
      //     //   filePaths.add(value!.path);
      //     // });
      //     String path = (await element.file)!.path;
      //     filePaths.add(path);
      //     // print(filePath.length);
      //   }
      // }
      // backUpDateString =
      //     DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      // print(filePaths.length);

      // for (var i = 0; i < count; i++) {}
    }
    totalUploadCount = filePaths.length;
    isPreparingBackUp.value = false;

    uploadByChunks(filePaths, imageChunkSize, 'video');
  }

  Future<void> uploadByChunks(
      List<String> filePath, int chunkSize, String backupType) async {
    totalbatchSize = 1;
    // Split the list of selected assets into chunks of 50
    // const chunkSize = 10;
    final chunks = List<List<String>>.generate(
        (filePath.length / chunkSize).ceil(),
        (index) => filePath.sublist(
            index * chunkSize,
            (index * chunkSize + chunkSize) < filePath.length
                ? (index * chunkSize + chunkSize)
                : filePath.length));
    totalbatchSize = chunks.length;
    chunkSizeUpdate = chunkSize;
    print(totalbatchSize);
    print(totalUploadCount);
    print(chunkSize);

    // print(chunks.length);
    // Iterate over each chunk and upload the files
    for (var chunk in chunks) {
      Constants.getUserTokenSharedPreference().then(
        (value) {
          String token = value.toString();

          if (chunk.isNotEmpty) {
            _uploadFile(true, "", chunk, token, '', backupType, null);
          }
        },
      );
    }
  }

  void backUpData(
      // bool backupDocs, bool backUpPhotos, bool backUpAudios,
      //   bool backUpVideos,
      bool backUpContacts,
      bool backUpWhatsappData) async {
    // // Perform backup actions one after the other based on user selected options
    // if (backupDocs) {
    //   // Perform backup for documents
    //   ProgressDialogUtils.showSuccessToast(" Documents Backup Started");
    //   print('Backing up documents...');
    // }

    // if (backUpPhotos) {
    //   // Perform backup for photos
    //   ProgressDialogUtils.showSuccessToast("Photos Backup Started");

    //   print('Backing up photos...');
    //   await photosBackUp();
    // }

    if (backUpContacts) {
      // Perform backup for contacts
      ProgressDialogUtils.showSuccessToast("Contacts Backup Started");

      print('Backing up contacts...');
      await backUpContact();
    }

    // if (backUpAudios) {
    //   // Perform backup for audios
    //   print('Backing up audios...');
    //   ProgressDialogUtils.showSuccessToast("Audios Backup Started");

    //   await audioBackUp();
    // }

    // if (backUpVideos) {
    //   ProgressDialogUtils.showSuccessToast("Videos Backup Started");

    //   // Perform backup for videos
    //   print('Backing up videos...');
    //   await videosBackUp();
    // }

    if (backUpWhatsappData) {
      ProgressDialogUtils.showSuccessToast("Whatsapp Backup Started");

      // Perform backup for WhatsApp data
      print('Backing up WhatsApp data...');
      await backupWhatsapp();
    }
  }

  Future cacheContacts(bool dbChanged) async {
    List<String> cachedData = await getContactsFromPrefs();
    if (cachedData.isEmpty || dbChanged) {
      print("contact fetching");
      Iterable<Contact> allContacts =
          await FlutterContacts.getContacts(withProperties: true);
      if (allContacts.isNotEmpty) {
        // Create a list of vCard data
        List<String> vCardList = [];

        // Convert FlutterContact objects to vCard data
        for (var contact in allContacts) {
          String vCard = contact.toVCard();
          vCardList.add(vCard);
        }
        await saveContactsToPrefs(vCardList);
        print("contact Cached");
      }
    }
  }

  // Function to save vCard strings to SharedPreferences
  Future<void> saveContactsToPrefs(List<String> vCardList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('cached_contacts', vCardList);
  }

  // Function to save vCard strings to SharedPreferences
  Future<void> saveUploadedContactsToPrefs(List<String> vCardList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('cached_uploadecontacts', vCardList);
  }

  // Function to retrieve vCard strings from SharedPreferences
  Future<List<String>> getContactsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('cached_contacts') ?? [];
  }

  // Function to retrieve vCard strings from SharedPreferences
  Future<List<String>> getUploadedContactsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('cached_uploadecontacts') ?? [];
  }
}

class DirStat {
  final int numberOfFiles;
  final int totalSize;

  DirStat({required this.numberOfFiles, required this.totalSize});

  // String get totalSizeString => FileSize.getSize(totalSize);
}
