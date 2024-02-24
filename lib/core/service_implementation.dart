import 'package:dio/dio.dart';
import 'package:safebox/core/constants/constants.dart';
import 'abstract.dart';

String baseUrl = 'http://192.168.43.144:8000/api';
String token = '';
bool? isUserLoggedIn = true;
Dio _dio = Dio();

class ServiceImplementation implements HttpService {
  @override
  void init() {
    getAuthCredentials();
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }));
    //initializeInterceptors();
    //getRequest("/faculty");
  }

  @override
  Future<Response> getRequest(String url) async {
    // ignore: unused_local_variable
    Response response;

    try {
      response = await _dio.get(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          }));
    } on DioException catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  Future getAuthCredentials() async {
    await Constants.getUerLoggedInSharedPreference().then((value) {
      isUserLoggedIn = value;
    });
    await Constants.getUserTokenSharedPreference().then((value) {
      token = value.toString();
    });
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
        onError: (DioException err, ErrorInterceptorHandler handler) {},
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) {},
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          if (response.data == "unauthenticated") {}
        }));
  }

  @override
  Future<Response> postRequest(String url, data) async {
    // ignore: unused_local_variable
    Response response;

    try {
      response = await _dio.post(url,
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          }));
    } on DioException catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> deleteRequest(String url, data) async {
    Response response;

    try {
      response = await _dio.delete(url,
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          }));
    } on DioException catch (e) {
      throw Exception(e.message);
    }
    return response;
  }
}
