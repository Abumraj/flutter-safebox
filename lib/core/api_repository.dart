import 'package:safebox/models/account_model.dart';
import 'package:safebox/models/fileoptions_item_model.dart';
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
  Future<List<UserfilesItemModel>> getSubFolderFiles(String path);
  Future<dynamic> postUploadFile(dynamic data);
  Future<dynamic> postCreateFolder(dynamic data);
  Future<dynamic> postStarFile(dynamic data);
  Future<dynamic> postRenameFolder(dynamic data);
  Future<dynamic> postUpdateProfile(dynamic data);
  Future<dynamic> postChangePassword(dynamic data);
  Future<dynamic> getDeleteFile(dynamic data);
  Future<UserDetail> getUserPlans();
  Future<UserDetail> getUserDetail();
  Future<dynamic> getDownload();
  Future<dynamic> getLogout();
}
