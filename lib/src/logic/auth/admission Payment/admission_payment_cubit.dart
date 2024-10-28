import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/app_constance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

part 'admission_payment_state.dart';

class AdmissionPaymentCubit extends Cubit<AdmissionPaymentState> {
  AdmissionPaymentCubit(super.initialState, {required this.context});

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();
  String? message;

  Future<void> admissionFeePayment(String selectionId, int amount) async {
    try {
      final response = await dio.post(
        ApiEndPoints.admissionFeePayment,
        data: {
          'selectId': selectionId,
          'amount': amount,
        },
      );
      message = response.data['message'] as String?;

      if (response.statusCode == 200) {
        Log.success('Admission fee payment successful');
        _showToast(message ?? '', Colors.green, CupertinoIcons.check_mark_circled_solid);
        if (context.mounted) {
          //  Navigator.pushReplacementNamed(context, HomePageView.routeName);
        }
      } else if (response.statusCode == 400 && message == "Payment already done") {
        _showToast(message ?? '', Colors.orange, Icons.warning);
      } else {
        Log.error('Admission fee payment failed: ${response.statusMessage}');
        _showToast(message ?? '', Colors.red, Icons.error);
      }
    } catch (e) {
      Log.error('Error during admission fee payment: ${e.toString()}');
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
