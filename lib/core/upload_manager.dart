import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';

String baseUrl = 'http://192.168.43.144:8000/api/file';

class Uploadanager extends GetxController {
  Rx<double> progressUpdate = 0.0.obs;
  int totalUploadSize = 0;
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
    print(file.path);

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
        onStatus: (status) {
          print(status);
        },
      );
    } catch (e) {
      print(e.toString());
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
      print(task);
      // backupTask = task;
      // isUploadStarted.value = true;
      await FileDownloader().upload(
        // print(task),
        task,
        onProgress: (progress) {
          if (!progress.isNegative) {
            // print(value);
            progressUpdate.value = progress * 100;

            // print('');
            print('-- underprogress $progressUpdate%');
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
      ProgressDialogUtils.showSuccessToast("Uploaded successfully");
      if (callBack != null) {
        callBack();
      }
    } catch (e) {
      print(e);
    }
  }

  _uploadBackupFile(file, token, folderId, productId) async {
    try {
      MultiUploadTask task = MultiUploadTask(
          url: baseUrl,
          files: file,
          // fields: {"parent_id": folderId, "productId": productId},
          updates: Updates.statusAndProgress,
          requiresWiFi: false,
          retries: 5,
          httpRequestMethod: 'POST',
          baseDirectory: BaseDirectory.temporary,
          directory: "",
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          });
      print(task);
      backupTask = task;
      var taskStatusUpdate = await FileDownloader().upload(
        // print(task),
        task,
        onProgress: (value) {
          if (!value.isNegative) {
            print(value);
          }
        },
        onStatus: (status) {
          print(status);
        },
      );

      // result.
    } catch (e) {
      print(e);
    }
  }

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
      // Handle the exception, show an error message, or log it
      print("Error getting external storage directory: $e");
      // Show toast or any other user interface feedback
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
        // Handle the case where WhatsApp is not found
        print("Whatsapp not found. Kindly install Whatsapp to backup chats.");
        // Show toast or any other user interface feedback
        ProgressDialogUtils.showFailureToast(
            "Whatsapp not found. Kindly install Whatsapp to backup chats.");
        return whatsappDatabase!;
      }
    } catch (e) {
      // Handle the exception, show an error message, or log it
      print("Error checking file existence: $e");
      // Show toast or any other user interface feedback
      ProgressDialogUtils.showFailureToast("Error checking file existence");
      return whatsappDatabase!;
    }

    return whatsappDatabase;
  }
}
