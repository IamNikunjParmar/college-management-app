import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(const LoginPageState());

  final DioInterceptors dio = DioInterceptors();

  Future<void> loginUser(String email, String password) async {
    try {
      Log.info("Enter");
      emit(state.copyWith(verifyEmail: true));
      final response = await dio.post(ApiEndPoints.loginUser, data: {
        'email': email,
        'password': password,
      });
      Log.info(response);

      final msg = response.data['message'];
      if (response.statusCode == 200) {
        Log.success("Login successfully");
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("token", response.data['token']);
        Log.info(prefs);
        _showToast(msg, Colors.green, Icons.check_circle);
      } else {
        Log.error("Invalid email or password");
        _showToast(msg, Colors.red, Icons.error);
      }
    } catch (e) {
      Log.error("Error during login: $e");
      Log.info(e.toString());
    }
  }

  void _showToast(String message, Color backgroundColor, IconData icon) {
    toastification.show(
      autoCloseDuration: const Duration(seconds: 3),
      title: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Colors.white, size: 35),
    );
  }
}
