import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/ui/auth/uploadDocument/upload_document_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

import '../../../package/utils/logger.dart';

part 'registration_verification_state.dart';

class RegistrationVerificationCubit extends Cubit<RegistrationVerificationState> {
  RegistrationVerificationCubit(super.initialState, {required this.context}) {}

  final DioInterceptors dio = DioInterceptors();
  final BuildContext context;

  Future<void> verifyOtp(String email, String otp) async {
    try {
      emit(state.copyWith(verifyOtp: true));
      final response = await dio.post(
        ApiEndPoints.verifyOtp,
        data: {
          'email': email,
          'otp': otp,
        },
      );
      Log.info(response);
      final msg = response.data['message'];
      Log.info(msg);
      if (response.statusCode == 200) {
        Log.success("Otp Verification Success");
        _showToast(msg, Colors.green, Icons.check_circle);
        final userId = response.data['data']['_id'];

        // id store for sharePreSharedPreferences
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('userId', userId);
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            UploadDocumentView.routeName,
            arguments: {'_id': userId},
            (route) => true,
          );
        }
      } else {
        Log.error("Invalid Otp");
        _showToast(msg, Colors.red, Icons.error);
      }
    } catch (e) {
      Log.error("Error verify: $e");
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
