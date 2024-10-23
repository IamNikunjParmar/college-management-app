import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';

import '../../../interceptor/interceptors.dart';
import '../../../package/data/modal/userDetailsModal/user_details_modal.dart';
import '../../../package/resorces/appConstance.dart';
import '../../../package/resorces/event_bus_provider.dart' as eventBusProvider;
import '../../../package/resorces/stream_sub.dart';
import '../../../package/utils/logger.dart';
part 'profile_page_state.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> with StreamSubscriptionMixin {
  late StreamSubscription _userAddedSubscription;

  ProfilePageCubit(super.initialState, {required this.context}) {
    getOneUserData();
    _userAddedSubscription = eventBusProvider.eventBus.on<ProfileUpdatedEvent>().listen((event) {
      Log.info("inside the eventbus :: ${event.updatedUser}");
      emit(state.copyWith(userData: event.updatedUser));
    });
  }

  final BuildContext context;

  final DioInterceptors dio = DioInterceptors();

  Future<void> getOneUserData() async {
    Log.error("enter");
    try {
      final response = await dio.get(ApiEndPoints.getOneUser);
      if (response.data is Map<String, dynamic>) {
        Log.debug("Fetch data");
        final user = UserDetailsModal.fromJson(response.data);
        emit(state.copyWith(userData: user));
      } else {
        Log.error('Unexpected response format: ${response.data}');
      }
    } catch (e) {
      Log.error(e);
    }
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
