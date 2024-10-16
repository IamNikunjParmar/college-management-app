import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/data/modal/getCourseModal/get_course_modal.dart';
import 'package:college_management_app/src/package/data/modal/userDetailsModal/user_details_modal.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  late StreamSubscription _userAddedSubscription;
  final eventBus = EventBus();
  HomePageCubit(super.initialState, {required this.context}) {
    getOneUserData();
    _userAddedSubscription = eventBus.on<UserUpdatedEvent>().listen((event) {
      getOneUserData();
    });
  }

  final BuildContext context;

  final DioInterceptors dio = DioInterceptors();

  Future<void> getOneUserData() async {
    try {
      final response = await dio.get(ApiEndPoints.getOneUser);
      if (response.data is Map<String, dynamic>) {
        final user = UserDetailsModal.fromJson(response.data);
        emit(state.copyWith(userData: user));
        eventBus.fire(UserUpdatedEvent(user));
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
    Log.debug(user);
  }

  Future<void> studentSelectCourse(String courseId, int round, String todayDate) async {
    String? msg;
    try {
      final response = await dio.post(
        ApiEndPoints.studentSelectCourse,
        data: {
          'courseId': courseId,
          'round': round,
          'todayDate': todayDate,
        },
      );
      msg = response.data['message'];
      final courseIdMsg = response.data['courseId'];
      var toastMsg = courseIdMsg;
      toastMsg = 'please select Your Course';

      if (response.statusCode == 200) {
        Log.success('Course selected successfully!');
        _showToast(msg ?? 'success', Colors.green, Icons.check_circle);
      } else {
        Log.error('Failed to select course: ${response.statusCode}');
        _showToast(toastMsg, Colors.red, Icons.error);
      }
    } catch (e) {
      Log.error('Exception during course selection: $e');
      _showToast(msg ?? 'An error occurred', Colors.red, Icons.error);
    }
  }

  void selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    String date = DateFormat('dd-MM-yyyy').format(pickedDate!);
    Log.success(date);
    emit(state.copyWith(selectedDate: date));
  }

  void _showToast(String message, Color backgroundColor, IconData icon) {
    toastification.show(
      autoCloseDuration: const Duration(seconds: 3),
      title: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Colors.white, size: 35),
    );
  }

  @override
  Future<void> close() {
    _userAddedSubscription.cancel();
    return super.close();
  }
}

class UserUpdatedEvent {
  final UserDetailsModal updatedUser;

  UserUpdatedEvent(this.updatedUser);
}
