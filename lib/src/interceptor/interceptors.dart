import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

import '../package/resorces/app_constance.dart';
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
          _handleError(error);
          return handler.next(error);
        },
      ),
    );
  }

  Dio get instance => _dio;

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameters);
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

void _handleError(DioException error) {
  Log.error(error.message);
  switch (error.response?.statusCode) {
    case 409:
      showErrorToast("Data is Already Present", "Try Something else");
      break;
    case 400:
      showErrorToast("Bad request.", " Please try again.");
      break;
    case 401:
      showErrorToast("Unauthorized.", " Please check your credentials.");
      break;
    case 403:
      showErrorToast("Access denied. ", "You do not have permission.");
      break;
    case 404:
      showErrorToast("Resource not found.", "Try Again");
      break;
    case 422:
      showErrorToast("Validation error.", "Please check your input");
      break;
    case 500:
      showErrorToast("Server error.", "Please try again later");
      break;
    default:
      showErrorToast("Something went wrong. ", "Please try again.");
      break;
  }
}

void showSuccessToast(String msg, String des) {
  toastification.show(
    title: Text(
      msg,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    type: ToastificationType.success,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 3),
    description: RichText(
      text: TextSpan(
        text: des,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      var offsetAnimation = Tween<Offset>(
        begin: const Offset(0, -1),
        end: const Offset(0, 0),
      ).animate(animation);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    showIcon: true,
    icon: const Icon(Icons.check_circle_outline_rounded),
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
  );
}

void showErrorToast(String msg, String des) {
  toastification.show(
    title: Text(
      msg,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    type: ToastificationType.error,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 4),
    description: RichText(
      text: TextSpan(
        text: des,
        style: const TextStyle(color: Colors.black),
      ),
    ),
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    showIcon: true,
    icon: const Icon(
      Icons.cancel,
    ),
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
  );
}
