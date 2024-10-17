import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';

import '../../../interceptor/interceptors.dart';
import '../../../package/data/modal/userDetailsModal/user_details_modal.dart';
import '../../../package/resorces/appConstance.dart';
import '../../../package/utils/logger.dart';

part 'profile_page_state.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit(super.initialState, {required this.context}) {
    getOneUserData();
    _userAddedSubscription = eventBus.on<ProfileUpdatedEvent>().listen((event) {
      updateUserProfile(event.updatedUser);
    });
  }

  final BuildContext context;
  final eventBus = EventBus();
  late StreamSubscription _userAddedSubscription;
  final DioInterceptors dio = DioInterceptors();

  Future<void> getOneUserData() async {
    try {
      final response = await dio.get(ApiEndPoints.getOneUser);
      if (response.data is Map<String, dynamic>) {
        final user = UserDetailsModal.fromJson(response.data);
        emit(state.copyWith(userData: user));
        eventBus.fire(ProfileUpdatedEvent(user));
      } else {
        Log.error('Unexpected response format: ${response.data}');
      }
    } catch (e) {
      Log.error(e);
    }
  }

  void updateUserProfile(UserDetailsModal updatedUser) {
    final user = state.userData?.copyWith(
          courseName: updatedUser.courseName,
          studentName: updatedUser.studentName,
        ) ??
        updatedUser;
    emit(state.copyWith(userData: user));
  }

  @override
  Future<void> close() {
    _userAddedSubscription.cancel();
    return super.close();
  }
}

class ProfileUpdatedEvent {
  final UserDetailsModal updatedUser;

  ProfileUpdatedEvent(this.updatedUser);
}
