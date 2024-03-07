import 'package:safebox/models/account_model.dart';
import 'package:safebox/models/fileoptions_item_model.dart';
import 'package:safebox/models/plan_model.dart';
import 'package:safebox/models/referred_user_model.dart';
import 'package:safebox/models/userfiles_item_model.dart';

abstract class ApiRepository {
  Future<dynamic> postLogin(dynamic data);
  Future<dynamic> postRegister(dynamic data);
  Future<dynamic> postGoogleLogin(dynamic data);
  // Future<dynamic> postGoogleLogin(dynamic data);
  Future<List<FileoptionsItemModel>> getProductList();
  Future<dynamic> getRecentFiles();
  Future<List<UserfilesItemModel>> getStarredFiles();
  Future<List<UserfilesItemModel>> getFilesByType(String productId);
  Future<List<UserfilesItemModel>> getAllFiles();
  Future<List<ReeferredUserModel>> getReferredUsers();
  Future<List<UserfilesItemModel>> getSubFolderFiles(String path);
  Future<dynamic> postUploadFile(dynamic data);
  Future<dynamic> postCreateFolder(dynamic data);
  Future<dynamic> postUserImage(dynamic data);
  Future<dynamic> postStarFile(dynamic data);
  Future<dynamic> postRenameFolder(dynamic data);
  Future<dynamic> postUpdateProfile(dynamic data);
  Future<dynamic> postChangePassword(dynamic data);
  Future<dynamic> getDeleteFile(dynamic data);
  Future<List<Plan>> getUserPlans();
  Future<UserDetail> getUserDetail();
  Future<dynamic> getDownload();
  Future<dynamic> getLogout();
  Future<dynamic> getAccessCode(int reference, String plancode);
  Future<dynamic> verifyTransaction(String reference, int subscriptionId);
}
