import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://HeartAttach.pythonanywhere.com",
        receiveDataWhenStatusError: true,
      )
    );
  }
  static Future<Response> postData(String url,Map<String,dynamic> query) async {
    return await dio.post(url,data:query);
  }
}
