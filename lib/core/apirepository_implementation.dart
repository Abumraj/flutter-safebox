import 'package:get/get.dart';
import 'package:safebox/core/api_repository.dart';
import 'package:safebox/core/service_implementation.dart';
import 'package:safebox/models/account_model.dart';
import 'package:safebox/models/fileoptions_item_model.dart';
import 'package:safebox/models/plan_model.dart';
import 'package:safebox/models/referred_user_model.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'abstract.dart';

class ApiRepositoryImplementation implements ApiRepository {
  HttpService _httpService = Get.put(ServiceImplementation());

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
  Future<UserDetail> getUserDetail() async {
    try {
      final response = await _httpService.getRequest(
        "/my-detail",
      );
      print(response);
      return UserDetail.fromJson(response.data);
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
  Future<List<UserfilesItemModel>> getAllFiles() async {
    try {
      final response = await _httpService.getRequest("/my-files");
      // print(response.data);
      List<UserfilesItemModel> list = parsedFileList(response.data['data']);
      print(list.length);
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<UserfilesItemModel>> getSubFolderFiles(path) async {
    try {
      final response = await _httpService.getRequest("/my-files/$path");
      List<UserfilesItemModel> list = parsedFileList(response.data['data']);
      print(list.length);
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<UserfilesItemModel>> getFilesByType(productId) async {
    try {
      final response =
          await _httpService.getRequest("/files-by-type/$productId");
      List<UserfilesItemModel> list = parsedFileList(response.data['data']);
      print(list.length);
      return list;
    } catch (e) {
      // print(e);
      return [];
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
  Future getDownload() {
    // TODO: implement getDownload
    throw UnimplementedError();
  }

  @override
  Future getRecentFiles() async {
    int page = 1;
    try {
      final response =
          await _httpService.getRequest("/recent-files?page=$page");
      if (response.data['links']['next'] != null) {
        page++;
      }
      return response;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<UserfilesItemModel>> getStarredFiles() async {
    try {
      final response = await _httpService.getRequest("/my-files?favourites=1");
      List<UserfilesItemModel> list = parsedFileList(response.data['data']);
      return list;
    } catch (e) {
      print(e);
      return [];
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
