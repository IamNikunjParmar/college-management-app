import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/ui/auth/login/login_page_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../interceptor/interceptors.dart';
import '../../../package/resorces/appConstance.dart';
import '../../../package/utils/logger.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(super.initialState, {required this.context}) {}

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();

  Future<void> resetPassword(String email, String otp, String newPassword, String confirmPassword) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.post(ApiEndPoints.resetPasswordWithOtp, data: {
        'email': email,
        'otp': otp,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      });
      Log.info(response);
      if (response.statusCode == 200) {
        Log.success('Password reset successful');
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            LoginPageView.routeName,
            (route) => false,
          );
        }
      } else {
        Log.error('Password reset failed: ${response.statusCode}');
      }
    } catch (e) {
      Log.error('Error during password reset: $e');
      Log.info(e.toString());
      emit(state.copyWith(isLoading: false, msg: e.toString()));
    }
  }
}
