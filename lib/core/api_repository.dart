import 'package:safebox/models/account_model.dart';
import 'package:safebox/models/fileoptions_item_model.dart';
import 'package:safebox/models/pagination_model.dart';
import 'package:safebox/models/plan_model.dart';
import 'package:safebox/models/referred_user_model.dart';
import 'package:safebox/models/transaction_model.dart';
import 'package:safebox/models/userfiles_item_model.dart';

abstract class ApiRepository {
  Future<dynamic> postLogin(dynamic data);
  Future<dynamic> postRegister(dynamic data);
  Future<dynamic> postGoogleLogin(dynamic data);
  // Future<dynamic> postGoogleLogin(dynamic data);
  Future<List<FileoptionsItemModel>> getProductList();
  Future<PaginationModel<UserfilesItemModel>> getRecentFiles();
  Future<PaginationModel<UserfilesItemModel>> getStarredFiles();
  Future<PaginationModel<UserfilesItemModel>> getFilesByType(
      String productId, int page);
  Future<PaginationModel<UserfilesItemModel>> getAllFiles(int page);
  Future<List<ReeferredUserModel>> getReferredUsers();
  Future<List<TransactionModel>> getTransactionHistory();
  Future<PaginationModel<UserfilesItemModel>> getSubFolderFiles(String path);
  Future<dynamic> postUploadFile(dynamic data);
  Future<dynamic> postCreateFolder(dynamic data);
  Future<dynamic> postUserImage(dynamic data);
  Future<dynamic> postStarFile(dynamic data);
  Future<dynamic> postPhoneVerificationRequest(dynamic data);
  Future<dynamic> postConfirmPhoneVerificationcode(dynamic data);
  Future<dynamic> postRenameFolder(dynamic data);
  Future<dynamic> postUpdateProfile(dynamic data);
  Future<dynamic> postChangePassword(dynamic data);
  Future<dynamic> getDeleteFile(dynamic data);
  Future<List<Plan>> getUserPlans();
  Future<UserDetail> getUserDetail(bool refresh);
  Future<String> getDownloadUrl(int id);
  Future<dynamic> postCopyFileOrFolder(dynamic data);
  Future<dynamic> postMoveFileOrFolder(dynamic data);
  Future<dynamic> postWithdrawal(dynamic data);
  Future<dynamic> getLogout();
  Future<String> getUpdatePhoneVerify();
  Future<dynamic> getAccessCode(int reference, String plancode);
  Future<dynamic> verifyTransaction(String reference, int subscriptionId);
}
