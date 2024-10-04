import 'package:dio/dio.dart';

import '../package/resorces/appConstance.dart';

class DioInterceptors extends Interceptor {
  late Dio _dio;

  DioClient() {
    _dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = '';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    ));
  }

  Future<Response> get(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } on DioException catch (e) {
      throw Exception('Failed to Make Api Call :- $e');
    }
  }

  Future<Response> post(String endpoint) async {
    try {
      return await _dio.post(endpoint, data: {});
    } on DioException catch (e) {
      throw Exception('\Failed to Make Api Call :- $e');
    }
  }
}
