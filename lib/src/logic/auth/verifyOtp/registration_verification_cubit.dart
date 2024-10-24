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
        showSuccessToast(msg, '');
        final userId = response.data['data']['_id'];
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            UploadDocumentView.routeName,
            arguments: {'_id': userId},
            (route) => true,
          );
        }
      } else {
        Log.error("Invalid Otp");
        showErrorToast(msg, '');
      }
    } catch (e) {
      Log.error("Error verify: $e");
    }
  }
}
