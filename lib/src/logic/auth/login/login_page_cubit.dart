import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:college_management_app/src/ui/auth/home/home_page_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit(super.initialState, {required this.context}) {}

  final DioInterceptors dio = DioInterceptors();
  final BuildContext context;

  Future<void> loginUser(String email, String password) async {
    String? msg;
    try {
      Log.info("Enter");
      emit(state.copyWith(verifyEmail: true));
      final response = await dio.post(ApiEndPoints.loginUser, data: {
        'email': email,
        'password': password,
      });
      Log.info(response);
      msg = response.data['message'];
      if (response.statusCode == 200) {
        Log.success("Login successfully");

        //Store for SharedPreferences with token
        final prefs = await SharedPreferences.getInstance();
        String token = response.data['token'];
        await prefs.setString("token", token);
        _showToast(msg ?? 'success', Colors.green, Icons.check_circle);
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            HomePageView.routeName,
            (route) => false,
          );
        }
      } else {
        Log.error("Invalid email or password");
        _showToast(msg ?? 'Invalid email or password', Colors.red, Icons.error);
      }
    } catch (e) {
      Log.error("Error during login: $e");
      _showToast(msg ?? 'An error occurred', Colors.red, Icons.error);
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

// nikunjparmar5066@gmail.com
