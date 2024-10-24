import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/logic/auth/profile/profile_page_cubit.dart';
import 'package:college_management_app/src/package/data/modal/userModal/user_modal.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../../package/data/modal/userDetailsModal/user_details_modal.dart';
import '../../../package/resorces/event_bus_provider.dart' as eventBusProvider;
import '../../../package/resorces/event_bus_provider.dart';
import '../../../package/utils/logger.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();

  EditProfileCubit(super.initialState, {required this.context}) {}

  Future<void> editProfileUser(UserDetailsModal user) async {
    try {
      final response = await dio.patch(ApiEndPoints.updateUser, data: user.toJson());

      final msg = response.data['message'];
      if (response.statusCode == 200) {
        final newUserData = response.data['data'];
        final data = UserDetailsModal.fromJson(newUserData);
        Log.debug(data);
        showSuccessToast(msg, '');
        eventBusProvider.eventBus.fire(ProfileUpdatedEvent(user));
        Log.success(ProfileUpdatedEvent(user));
        if (context.mounted) {
          Navigator.pop(context, state.user);
        }
      } else {
        _handleError(response.statusCode);
      }
    } catch (e) {
      Log.error("Error ::: ${e.toString()}");
    }
  }

  void _handleError(int? statusCode) {
    if (statusCode == 400) {
      _showToast('Bad Request', Colors.red, Icons.error);
    } else if (statusCode == 401) {
      _showToast('Unauthorized', Colors.red, Icons.error);
    } else if (statusCode == 403) {
      _showToast('Forbidden', Colors.red, Icons.error);
    } else if (statusCode == 404) {
      _showToast('Not Found', Colors.red, Icons.error);
    } else if (statusCode == 500) {
      _showToast('Internal Server Error', Colors.red, Icons.error);
    } else {
      _showToast('Unknown Error', Colors.red, Icons.error);
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
