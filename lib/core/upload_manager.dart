import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = 'http://192.168.43.144:8000/api/file';

class Uploadanager extends GetxController {
  List<AssetEntity> mediaAssets = [];
  Rx<double> progressUpdate = 0.0.obs;
  int totalUploadSize = 0;
  int totalbatchSize = 1;
  String backUpDateKey = '';
  DateTime? backUpDate;
  String backUpDateString = '';

// List<DownloadTask> recoveryTask = [];
  static late MultiUploadTask backupTask;
  Rx<bool> isUploadStarted = false.obs;
  Rx<TaskRecord>? trackRecord;
  resetProgress() {
    progressUpdate.value = 0.0;
    totalUploadSize = 0;
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

  // static _handleFileUpload(List<String?> paths, folderId, String token) async {
  //   await uploadTracker.enqueue(
  //       _buildUpload(paths.whereType<String>().toList(), folderId, token));
  // }

  // static Upload _buildUpload(List<String> paths, int? folderId, String token) {
  //   const tag = 'upload';
  //   print(paths.length);
  //   return MultipartFormDataUpload(
  //     url: baseUrl.toString(),
  //     data: {'folderId': "12"},
  //     files: paths.map((e) => FileItem(path: e, field: 'file')).toList(),
  //     headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
  //     method: UploadMethod.POST,
  //     tag: tag,
  //     allowCellular: true,
  //   );
  // }

  static backgroundDownloaderSetup() {
    void myNotificationTapCallback(
        Task task, NotificationType notificationType) {
      debugPrint(
          'Tapped notification $notificationType for taskId ${task.taskId}');
    }

    FileDownloader().configure(globalConfig: [
      (Config.requestTimeout, const Duration(seconds: 100)),
    ], androidConfig: [
      (Config.useCacheDir, Config.whenAble),
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
            // for the 'Download & Open' dog picture
            // which uses 'download' which is not the .defaultGroup
            // but the .await group so won't use the above config
            complete: const TaskNotification(
                'Backup {filename.length}', 'Backup complete'),
            tapOpensFile: false);
    // void myNotificationTapCallback(
    //     Task task, NotificationType notificationType) {
    //   debugPrint(
    //       'Tapped notification $notificationType for taskId ${task.taskId}');
    // }
  }

  Future<List<Contact>> extractContact() async {
    List<Contact> recoveredContacts = [];
    File importedContact =
        File("/data/user/0/com.example.safebox/app_flutter/contacts.vcf");
    if (importedContact.existsSync()) {
      var vCardContacts = await File(
              "/data/user/0/com.example.safebox/app_flutter/contacts.vcf")
          .readAsString();
      // ignore: unused_local_variable
      List<String> vCardList = vCardContacts.split('\n');

      List<Contact> recoveredContacts = [];
      for (var element in vCardList) {
        Contact contact = Contact.fromVCard(element);
        print(contact.displayName);
        recoveredContacts.add(contact);
      }
    }
    return recoveredContacts;
  }

  void uploadContact(List<Contact> contacts, {Function? callBack}) async {
    totalUploadSize = 0;
    List<Contact> preContact = [];
    extractContact().then((value) {
      preContact.addAll(value);
      preContact.addAll(contacts);
    });
    // List<Contacts> contactToUpload = [];
    List<String> vCardList = [];

    for (var contact in preContact) {
      String vCard = contact.toVCard();
      vCardList.add(vCard);
    }
    // Combine vCard data into a single string
    String combinedVCardData = vCardList.join('\n');
    Directory appDir = await getApplicationDocumentsDirectory();
    File file = File('${appDir.path}/contacts.vcf');
    file = await file.writeAsString(combinedVCardData);
    file = File('${appDir.path}/contacts.vcf');

    totalUploadSize = file.lengthSync();
    Constants.getUserTokenSharedPreference().then((value) {
      _uploadFile(false, "", ["contacts.vcf"], value.toString(), "folderId",
          "productId", callBack);
    });

    // } else {
  }

  // trckUploadProgress(taskId)async{
  //   final record = await FileDownloader().database.recordForId(taskId);
  //    if (record!.status == TaskStatus.running) {
  //      trackRecord!.value = record;
  //   // print('-- progress ${record.progress * 100}%');
  //   // print('-- file size ${record.expectedFileSize} bytes');
  //   print(trackRecord);
  // }
  //  }

  downloadFile() async {
    try {
      DownloadTask task = DownloadTask(
          url:
              "https://jsoncompare.org/LearningContainer/SampleFiles/Video/MP4/Sample-MP4-Video-File-Download.mp4",
          filename: "sampleVideo",
          directory: 'my_sub_directory',
          updates: Updates.statusAndProgress,
          requiresWiFi: false,
          retries: 5,
          allowPause: true,
          metaData: 'data for me');

      await FileDownloader().download(
        task,
        onProgress: (value) {
          if (!value.isNegative) {
            // progressPer = value;
          }
        },
        onStatus: (status) {},
      );
    } catch (e) {
      return e;
    }
  }

  _uploadFile(isTemp, directory, files, token, folderId, productId,
      Function? callBack) async {
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
          if (!progress.isNegative && totalbatchSize == 1) {
            progressUpdate.value = progress * 100;
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
        ProgressDialogUtils.showSuccessToast("Uploaded successfully");
      }
      if (progressUpdate.value == 100 && totalbatchSize > 1) {
        int batchSizeTracker = 0;
        if (batchSizeTracker != totalbatchSize) {
          batchSizeTracker += batchSizeTracker;
        }
        progressUpdate.value = (batchSizeTracker / totalUploadSize) * 100;
        if (batchSizeTracker == totalUploadSize) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(backUpDateKey, backUpDateString);
        }
      }
      if (callBack != null) {
        callBack();
      }
    } catch (e) {
      return e;
    }
  }

  // _uploadBackupFile(file, token, folderId, productId) async {
  //   try {
  //     MultiUploadTask task = MultiUploadTask(
  //         url: baseUrl,
  //         files: file,
  //         // fields: {"parent_id": folderId, "productId": productId},
  //         updates: Updates.statusAndProgress,
  //         requiresWiFi: false,
  //         retries: 5,
  //         httpRequestMethod: 'POST',
  //         baseDirectory: BaseDirectory.temporary,
  //         directory: "",
  //         headers: {
  //           'Accept': 'application/json',
  //           'Authorization': 'Bearer $token'
  //         });
  //     backupTask = task;
  //     await FileDownloader().upload(
  //       // print(task),
  //       task,
  //       onProgress: (value) {
  //         if (!value.isNegative) {}
  //       },
  //       onStatus: (status) {},
  //     );

  //     // result.
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  backupWhatsapp() {
    whatsappDatabaseLookup().then((value) {
      if (value.existsSync()) {
        // _uploadBackupFile(value, token, folderId, productId);
      }
    });
  }

  backupContact() async {
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
      // Combine vCard data into a single string
      String combinedVCardData = vCardList.join('\n');
      Directory appDir = await getApplicationDocumentsDirectory();
      File file = File('${appDir.path}/contacts.vcf');
      file = await file.writeAsString(combinedVCardData);
      // _uploadBackupFile(file, token, folderId, productId);
    }
  }

  Future<File> whatsappDatabaseLookup() async {
    File? whatsappDatabase;

    Directory? externalDir;
    try {
      externalDir = await getExternalStorageDirectory();
    } catch (e) {
      ProgressDialogUtils.showFailureToast(
          "Error getting external storage directory");
      return whatsappDatabase!;
    }

    String externalPath = externalDir!.path;
    String whatsappBusinessPathOnHigherAndroidVersion = "$externalPath/";
    String whatsappPathOnHigherAndroidVersion = "$externalPath/";
    String whatsappBusinessPathOnLowerAndroidVersion = "$externalPath/";
    String whatsappPathOnLowerAndroidVersion = "$externalPath/";

    try {
      if (File(whatsappBusinessPathOnLowerAndroidVersion).existsSync()) {
        whatsappDatabase = File(whatsappBusinessPathOnLowerAndroidVersion);
      } else if (File(whatsappBusinessPathOnHigherAndroidVersion)
          .existsSync()) {
        whatsappDatabase = File(whatsappBusinessPathOnHigherAndroidVersion);
      } else if (File(whatsappPathOnLowerAndroidVersion).existsSync()) {
        whatsappDatabase = File(whatsappPathOnLowerAndroidVersion);
      } else if (File(whatsappPathOnHigherAndroidVersion).existsSync()) {
        whatsappDatabase = File(whatsappPathOnHigherAndroidVersion);
      } else {
        ProgressDialogUtils.showFailureToast(
            "Whatsapp not found. Kindly install Whatsapp to backup chats.");
        return whatsappDatabase!;
      }
    } catch (e) {
      ProgressDialogUtils.showFailureToast("Error checking file existence");
      return whatsappDatabase!;
    }

    return whatsappDatabase;
  }

  Future<void> fetchImages() async {
    backUpDateKey = 'photo_last_backup_date';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastBackupDateString = prefs.getString('photo_last_backup_date');

    if (lastBackupDateString != null) {
      backUpDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').parse(lastBackupDateString);
    }

    int imageChunkSize = 50;
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
      //     // print(filePath.length);
      //   }
      // }

      uploadByChunks(filePaths, imageChunkSize, 'photo');
      // for (var i = 0; i < count; i++) {}
    }
  }

  Future<void> audioBackUp() async {
    backUpDateKey = 'audio_last_backup_date';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastBackupDateString = prefs.getString('audio_last_backup_date');

    if (lastBackupDateString != null) {
      backUpDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').parse(lastBackupDateString);
    }

    int imageChunkSize = 50;
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
      //     // print(filePath.length);
      //   }
      // }

      uploadByChunks(filePaths, imageChunkSize, 'audio');
      // for (var i = 0; i < count; i++) {}
    }
  }

  Future<void> videosBackUp() async {
    backUpDateKey = 'video_last_backup_date';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastBackupDateString = prefs.getString('video_last_backup_date');

    if (lastBackupDateString != null) {
      backUpDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').parse(lastBackupDateString);
    }

    int imageChunkSize = 15;
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
      //     // print(filePath.length);
      //   }
      // }
      // backUpDateString =
      //     DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      uploadByChunks(filePaths, imageChunkSize, 'video');
      // for (var i = 0; i < count; i++) {}
    }
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
    totalbatchSize == chunks.length;
    print(totalbatchSize);
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
}
