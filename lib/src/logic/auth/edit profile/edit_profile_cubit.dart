import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/data/modal/userModal/user_modal.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';

import '../../../package/data/modal/userDetailsModal/user_details_modal.dart';
import '../../../package/utils/logger.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(super.initialState, {required this.context}) {}

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();

  Future<void> editProfileUser(UserDetailsModal user) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.patch(ApiEndPoints.updateUser, data: user.toJson());
      Log.debug(response);
      final newUserData = response.data['data'];
      final data = UserDetailsModal.fromJson(newUserData);
      Log.debug(data);
      if (!isClosed) {
        emit(state.copyWith(user: data, isLoading: false));
      }
    } catch (e) {
      Log.error("Error ::: ${e.toString()}");
      if (!isClosed) {
        emit(state.copyWith(isLoading: false));
      }
    }
  }
}
