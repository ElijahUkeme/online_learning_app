import 'package:dio/dio.dart';
import 'package:online_learning_app/constants/constants.dart';
import 'package:online_learning_app/service/global.dart';

class NetworkRequestUtil {
  static NetworkRequestUtil _instance = NetworkRequestUtil._internal();

  factory NetworkRequestUtil() {
    return _instance;
  }

  late Dio dio;

  NetworkRequestUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.APP_BASE_URL,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        headers: {},
        contentType: "application/json",
        responseType: ResponseType.json);
    dio = Dio(options);
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response =
        await dio.post(path, data: data, queryParameters: queryParameters);
    print("My response data is ${response.toString()}");
    print("My status code is ${response.statusCode.toString()}");
    return response.data;
  }

  Future getData(String path) async {
    var response = await dio.get(path);
    print("Get method calling");
    return response.data;
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var header = <String, dynamic>{};
    var accessToken = Global.service.getUserToken();
    if (accessToken.isNotEmpty) {
      header['Authorization'] = 'Bearer $accessToken';
    }
    return header;
  }
}
