import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/data/modal/userDetailsModal/user_details_modal.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../../package/utils/logger.dart';
import '../../../ui/auth/login/login_page_view.dart';

part 'log_out_user_state.dart';

class LogOutUserCubit extends Cubit<LogOutUserState> {
  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();
  LogOutUserCubit(super.initialState, {required this.context}) {}

  String? msg;
  Future<void> logOutUserData(UserDetailsModal user) async {
    try {
      final response = await dio.post(
        ApiEndPoints.logoutUser,
        data: {'_id': user.id},
      );

      msg = response.data['message'];
      if (response.statusCode == 200) {
        Log.info('User logout Successfully');
        _showToast(msg ?? 'success', Colors.green, Icons.check_circle);
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, LoginPageView.routeName);
        }
      } else {
        Log.debug('Failed to log out');
        _showToast(msg ?? 'Failed to log out', Colors.red, Icons.error);
      }
    } catch (e) {
      Log.error("Error logging out: ${e.toString()}");
      _showToast(msg ?? 'LogOut Error for Server', Colors.red, Icons.error);
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
