import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:college_management_app/src/ui/auth/login/login_page_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

part 'registration_fee_payment_state.dart';

class RegistrationFeePaymentCubit extends Cubit<RegistrationFeePaymentState> {
  RegistrationFeePaymentCubit(super.initialState, {required this.context}) {}

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();

  Future<void> feesPayment(String userId, String email, String amount) async {
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
        _showToast(msg, Colors.green, Icons.check_circle);
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            LoginPageView.routeName,
            (route) => false,
          );
        }
      } else {
        Log.error('Payment failed');
        _showToast(msg, Colors.red, Icons.error);
      }
    } catch (e) {
      Log.error(e);
      Log.error(e.toString());
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
