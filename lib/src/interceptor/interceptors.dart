import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../package/resorces/appConstance.dart';
import '../package/utils/logger.dart';

class DioInterceptors extends Interceptor {
  late Dio _dio;

  DioInterceptors() {
    _initializeDio();
  }

  void _initializeDio() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 9),
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 422) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString("token");
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Dio get instance => _dio;

  Future<Response> get(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } on DioException catch (e) {
      throw Exception('Failed to Make API Call: $e');
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } on DioException catch (e) {
      throw Exception('Failed to Make API Call: $e');
    }
  }

  Future<Response> patch(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.patch(endpoint, data: data);
    } on DioException catch (e) {
      throw Exception('Failed to Make API Call $e');
    }
  }

  Future<Response> delete(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } on DioException catch (e) {
      throw Exception('Failed to Make API Call $e');
    }
  }
}
