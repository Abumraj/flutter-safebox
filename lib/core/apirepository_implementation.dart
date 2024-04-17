import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:safebox/core/api_repository.dart';
import 'package:safebox/core/service_implementation.dart';
import 'package:safebox/models/account_model.dart';
import 'package:safebox/models/fileoptions_item_model.dart';
import 'package:safebox/models/pagination_model.dart';
import 'package:safebox/models/plan_model.dart';
import 'package:safebox/models/referred_user_model.dart';
import 'package:safebox/models/transaction_model.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'abstract.dart';

class ApiRepositoryImplementation implements ApiRepository {
  HttpService _httpService = Get.put(ServiceImplementation());
  var dio = Dio();

  ApiRepositoryImplementation() {
    _httpService = Get.put(ServiceImplementation());
    _httpService.init();
  }

  @override
  Future getLogout() async {
    try {
      final response = await _httpService.getRequest("/logout");

      return response.data;
    } catch (e) {
      return e;
    }
  }

  @override
  Future<List<FileoptionsItemModel>> getProductList() async {
    try {
      final response = await _httpService.getRequest("/products");
      print(response.data);
      List<FileoptionsItemModel> list = parsedProductList(response.data);
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static List<FileoptionsItemModel> parsedProductList(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed
        .map<FileoptionsItemModel>(
            (json) => FileoptionsItemModel.fromJson(json))
        .toList();
  }

  @override
  Future<UserDetail> getUserDetail(bool refresh) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheKey = "userProfile";
    try {
      if (prefs.containsKey(cacheKey) && !refresh) {
        final cachedData = prefs.getString(cacheKey)!;
        return UserDetail.fromJson(jsonDecode(cachedData));
      } else {
        final response = await _httpService.getRequest(
          "/my-detail",
        );
        print(response);
        return UserDetail.fromJson(response.data);
      }
    } catch (e) {
      print(e);
      return UserDetail(); // return an empty list on exception/error
    }
  }

  @override
  Future postChangePassword(data) async {
    try {
      final response = await _httpService.postRequest(
        "/update-password",
        data,
      );
      return response.data;
    } catch (e) {
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future postLogin(data) async {
    try {
      final response = await _httpService.postRequest(
        "/login",
        data,
      );

      return response.data;
    } catch (e) {
      // print(e);
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future postRegister(data) async {
    try {
      final response = await _httpService.postRequest(
        "/register",
        data,
      );
      return response.data;
    } catch (e) {
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future postGoogleLogin(data) async {
    try {
      final response = await _httpService.postRequest(
        "/google",
        data,
      );
      return response.data;
    } catch (e) {
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future postUpdateProfile(data) async {
    try {
      final response = await _httpService.postRequest(
        "/update-profile",
        data,
      );
      return response.data;
    } catch (e) {
      print(e);
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future postCreateFolder(data) async {
    try {
      final response = await _httpService.postRequest(
        "/folder/create",
        data,
      );

      return response.data;
    } catch (e) {
      // print(e);
      // throw Exception(e);
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future postRenameFolder(data) async {
    try {
      final response = await _httpService.postRequest(
        "/folder/rename",
        data,
      );
      return response.data;
    } catch (e) {
      print(e);
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future postWithdrawal(data) async {
    try {
      final response = await _httpService.postRequest(
        "/withdrawal",
        data,
      );
      return response.data;
    } catch (e) {
      print(e);
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future postPhoneVerificationRequest(data) async {
    String termiiUrl = 'https://api.ng.termii.com';

    // try {
    final response = await dio.post("$termiiUrl/api/sms/otp/send",
        data: data,
        options: Options(contentType: 'appliction/json', headers: {}));
    print(response);
    return response.data;
    // } catch (e) {
    //   print(e);
    //   return 'error'; // return an empty list on exception/error
    // }
  }

  @override
  Future postConfirmPhoneVerificationcode(data) async {
    String termiiUrl = 'https://api.ng.termii.com';

    try {
      final response = await dio.post("$termiiUrl/api/sms/otp/verify",
          data: data, options: Options(headers: {}));
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future<PaginationModel<UserfilesItemModel>> getAllFiles(int page) async {
    try {
      final response = await _httpService.getRequest("/my-files?page=$page");
      List<UserfilesItemModel> list = parsedFileList(response.data['data']);
      final meta = response.data['meta'];
      final currentPage = meta['current_page'];
      final lastPage = meta['last_page'];
      final hasNextPage = currentPage < lastPage;
      // final List<UserfilesItemModel> items = response.data['data'];
      // print(list.length);
      return PaginationModel<UserfilesItemModel>(
        items: list,
        currentPage: currentPage,
        hasMoreItems: hasNextPage,
      );
    } catch (e) {
      // print(e);
      throw Exception('Failed to fetch files page: $e');
    }
  }

  @override
  Future<PaginationModel<UserfilesItemModel>> getSubFolderFiles(path) async {
    try {
      final response = await _httpService.getRequest("/my-files/$path");
      List<UserfilesItemModel> list = parsedFileList(response.data['data']);
      print(list.length);
      final meta = response.data['meta'];
      final currentPage = meta['current_page'];
      final lastPage = meta['last_page'];
      final hasNextPage = currentPage < lastPage;
      // final List<UserfilesItemModel> items = response.data['data'];
      // print(list.length);
      return PaginationModel<UserfilesItemModel>(
        items: list,
        currentPage: currentPage,
        hasMoreItems: hasNextPage,
      );
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch files page: $e');
    }
  }

  @override
  Future<PaginationModel<UserfilesItemModel>> getFilesByType(
      productId, page) async {
    try {
      final response =
          await _httpService.getRequest("/files-by-type/$productId?page=$page");
      List<UserfilesItemModel> list = parsedFileList(response.data['data']);
      final meta = response.data['meta'];
      final currentPage = meta['current_page'];
      final lastPage = meta['last_page'];
      final hasNextPage = currentPage < lastPage;
      // final List<UserfilesItemModel> items = response.data['data'];
      // print(list.length);
      return PaginationModel<UserfilesItemModel>(
        items: list,
        currentPage: currentPage,
        hasMoreItems: hasNextPage,
      );
    } catch (e) {
      // print(e);
      throw Exception('Failed to fetch files page: $e');
    }
  }

  static List<UserfilesItemModel> parsedFileList(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed
        .map<UserfilesItemModel>((json) => UserfilesItemModel.fromJson(json))
        .toList();
  }

  static List<Plan> parsedPlanList(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed.map<Plan>((json) => Plan.fromJson(json)).toList();
  }

  static List<TransactionModel> parsedTransactionList(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed
        .map<TransactionModel>((json) => TransactionModel.fromJson(json))
        .toList();
  }

  static List<ReeferredUserModel> parsedReferralList(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed
        .map<ReeferredUserModel>((json) => ReeferredUserModel.fromJson(json))
        .toList();
  }

  @override
  Future getDeleteFile(data) async {
    try {
      final response = await _httpService.deleteRequest(
        "/file/delete-forever",
        data,
      );
      return response.data;
    } catch (e) {
      print(e);
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future<String> getDownloadUrl(int id) async {
    try {
      final response = await _httpService.getRequest("/file/download/$id");
      print(response.data);
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch files page: $e');
    }
  }

  @override
  Future<String> getUpdatePhoneVerify() async {
    try {
      final response = await _httpService.getRequest("/verification-confirmed");
      print(response.data);
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch files page: $e');
    }
  }

  @override
  Future<PaginationModel<UserfilesItemModel>> getRecentFiles() async {
    try {
      final response = await _httpService.getRequest("/recent-files");
      List<UserfilesItemModel> list = parsedFileList(response.data['data']);
      final meta = response.data['meta'];
      final currentPage = meta['current_page'];
      final lastPage = meta['last_page'];
      final hasNextPage = currentPage < lastPage;
      // final List<UserfilesItemModel> items = response.data['data'];
      // print(list.length);
      return PaginationModel<UserfilesItemModel>(
        items: list,
        currentPage: currentPage,
        hasMoreItems: hasNextPage,
      );
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch files page: $e');
    }
  }

  @override
  Future<PaginationModel<UserfilesItemModel>> getStarredFiles() async {
    try {
      final response = await _httpService.getRequest("/my-files?favourites=1");
      List<UserfilesItemModel> list = parsedFileList(response.data['data']);
      final meta = response.data['meta'];
      final currentPage = meta['current_page'];
      final lastPage = meta['last_page'];
      final hasNextPage = currentPage < lastPage;
      // final List<UserfilesItemModel> items = response.data['data'];
      // print(list.length);
      return PaginationModel<UserfilesItemModel>(
        items: list,
        currentPage: currentPage,
        hasMoreItems: hasNextPage,
      );
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch files page: $e');
    }
  }

  @override
  Future<List<Plan>> getUserPlans() async {
    try {
      final response = await _httpService.getRequest("/plans");
      print(response.data);
      List<Plan> list = parsedPlanList(response.data);
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<TransactionModel>> getTransactionHistory() async {
    try {
      final response = await _httpService.getRequest("/transaction-history");
      print(response.data);
      List<TransactionModel> list = parsedTransactionList(response.data);
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<ReeferredUserModel>> getReferredUsers() async {
    try {
      final response = await _httpService.getRequest("/referral");
      print(response.data);
      List<ReeferredUserModel> list = parsedReferralList(response.data);
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future postStarFile(data) async {
    try {
      final response = await _httpService.postRequest(
        "/file/add-to-favourites",
        data,
      );
      return response.data;
    } catch (e) {
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future postMoveFileOrFolder(data) async {
    try {
      final response = await _httpService.postRequest(
        "/move",
        data,
      );
      return response.data;
    } catch (e) {
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future postCopyFileOrFolder(data) async {
    try {
      final response = await _httpService.postRequest(
        "/copy",
        data,
      );
      return response.data;
    } catch (e) {
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future postUserImage(data) async {
    try {
      final response = await _httpService.postRequest(
        "/upload",
        data,
      );
      return response.data;
    } catch (e) {
      print(e);
      return 'error'; // return an empty list on exception/error
    }
  }

  @override
  Future getAccessCode(int amount, plancode) async {
    try {
      final response = await _httpService.postRequest(
        "/transactionInit",
        {"amount": amount, "code": plancode},
      );

      return response.data;
    } catch (e) {
      return e; // return an empty list on exception/error
    }
  }

  @override
  Future verifyTransaction(String reference, int subscriptionId) async {
    try {
      final response = await _httpService.postRequest(
        "/transactionVerify",
        {
          "reference": reference,
          "subscriptionId": subscriptionId,
        },
      );
      return response.data;
    } catch (e) {
      return e; // return an empty list on exception/error
    }
  }

  @override
  Future postUploadFile(data) {
    // TODO: implement postUploadFile
    throw UnimplementedError();
  }
}
