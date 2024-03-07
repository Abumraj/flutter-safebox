import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.blue,
              // Colors.white,
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }

  static void showSuccessToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showFailureToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static String formatFileSize(int fileSizeInBytes) {
    const int KB = 1024;
    const int MB = KB * 1024;
    const int GB = MB * 1024;

    if (fileSizeInBytes < KB) {
      return '$fileSizeInBytes B';
    } else if (fileSizeInBytes < MB) {
      double sizeInKB = fileSizeInBytes / KB;
      return '${sizeInKB.toStringAsFixed(2)} KB';
    } else if (fileSizeInBytes < GB) {
      double sizeInMB = fileSizeInBytes / MB;
      return '${sizeInMB.toStringAsFixed(2)} MB';
    } else {
      double sizeInGB = fileSizeInBytes / GB;
      return '${sizeInGB.toStringAsFixed(2)} GB';
    }
  }

  static String removeWhitespaceBetweenCharacters(String input) {
    return input.replaceAll(RegExp(r'\s+(?=\S)|(?<=\S)\s+'), '');
  }

  static int getSizeComparableValue(String? sizeString) {
    String sizeStringers = removeWhitespaceBetweenCharacters(sizeString!);
    final unitRegex = RegExp(r'[a-zA-Z]+$');
    final sizeRegex = RegExp(r'^[0-9.]+');

    final sizeMatch = sizeRegex.firstMatch(sizeStringers);
    final unitMatch = unitRegex.firstMatch(sizeStringers);

    if (sizeMatch == null || unitMatch == null) {
      throw ArgumentError('Invalid size format. Use format like "100mb"');
    }

    final size = double.parse(sizeMatch.group(0)!);
    final unit = unitMatch.group(0)!.toUpperCase();

    const Map<String, int> units = {
      'B': 1,
      'KB': 1024,
      'MB': 1024 * 1024, // 1 MB = 1024^2 bytes
      'GB': 1024 * 1024 * 1024, // 1 GB = 1024^3 bytes
      'TB': 1024 * 1024 * 1024 * 1024 // 1 TB = 1024^4 bytes
    };

    if (units.containsKey(unit)) {
      return (size * units[unit]!).round();
    } else {
      throw ArgumentError('Invalid storage unit specified');
    }
  }

  static String formatDateTime(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));

    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return 'Today';
    } else if (dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day) {
      return 'Yesterday';
    } else {
      // Format the date as 'Day, Month, Year'
      return DateFormat('d, MMM, y').format(dateTime);
      // The 'd' represents the day of the month, 'MMM' is the abbreviated month name, and 'y' is the year.
    }
  }
}
