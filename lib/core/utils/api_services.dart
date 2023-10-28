import 'package:dio/dio.dart';

class ApiServices {
  late final Dio? dio;

  final String _baseUrl = 'https://www.googleapis.com/books/v1';
  ApiServices({required this.dio}) {
    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20 * 1000),
      receiveTimeout: const Duration(seconds: 20 * 1000),
    );
    dio = Dio(options);
    dio!.interceptors.add(
      LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        requestBody: true,
      ),
    );
  }

  Future<Map<String, dynamic>> getRequest({required String endPoint}) async {
    var response = await dio!.get('$_baseUrl/$endPoint');
    return response.data;
  }
}
