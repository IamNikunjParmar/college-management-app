import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/ui/auth/login/login_page_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

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
      if (response.statusCode == 200) {
        Log.success("Otp Verification Success");
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            LoginPageView.routeName,
            (route) => false,
          );
        }
      } else {
        // Handle error
        Log.error("Invalid Otp");
      }
    } catch (e) {
      // Handle exception
      Log.error("Error verify: $e");
    }
  }
}
