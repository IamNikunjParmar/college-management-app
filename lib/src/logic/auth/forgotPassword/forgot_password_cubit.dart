import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/ui/auth/reset%20password%20With%20Otp/reset_password_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../package/utils/logger.dart';
import '../../../ui/auth/login/login_page_view.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(super.initialState, {required this.context}) {}

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();
  Future<void> forgotPassword(String email, Object? arguments) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.post(ApiEndPoints.forgetPasswordOtp, data: {
        'email': email,
      });
      Log.info(response);
      if (response.statusCode == 200) {
        Log.success('Forgot password request successful');
        emit(state.copyWith(isLoading: true, msg: "Success"));
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            ResetPasswordView.routeName,
            arguments: arguments,
            (route) => true,
          );
        }
      } else {
        Log.error('Forgot password request failed: ${response.statusCode}');
      }
    } catch (e) {
      Log.error('Error during forgot password request: $e');
      Log.info(e.toString());
      emit(state.copyWith(isLoading: false, msg: e.toString()));
    }
  }
}
