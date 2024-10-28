import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/app_constance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:college_management_app/src/ui/auth/login/login_page_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'registration_fee_payment_state.dart';

class RegistrationFeePaymentCubit extends Cubit<RegistrationFeePaymentState> {
  RegistrationFeePaymentCubit(super.initialState, {required this.context});

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();

  Future<void> feesPayment(String userId, String email, int amount) async {
    try {
      final response = await dio.post(
        ApiEndPoints.registrationFeePayment,
        data: {
          'userId': userId,
          'email': email,
          'amount': amount,
        },
      );
      Log.debug(response);
      final msg = response.data['message'];
      Log.info(msg);
      if (response.statusCode == 200) {
        Log.success('Payment successful');
        showSuccessToast(msg, '');
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            LoginPageView.routeName,
            (route) => false,
          );
        }
      } else {
        Log.error('Payment failed');
        showErrorToast(msg, '');
      }
    } catch (e) {
      Log.error(e);
    }
  }
}
