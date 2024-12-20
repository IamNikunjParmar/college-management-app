import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/data/modal/getCourseModal/get_course_modal.dart';
import 'package:college_management_app/src/package/data/modal/userDetailsModal/user_details_modal.dart';
import 'package:college_management_app/src/package/resorces/app_constance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:college_management_app/src/ui/auth/Get%20Selecte%20College%20From%20Course/select_college_for_course.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(super.initialState, {required this.context}) {
    // getOneUserData();
  }

  final BuildContext context;

  final DioInterceptors dio = DioInterceptors();

  String? selectionId;
  String? collegeId;

  Future<void> getOneUserData() async {
    try {
      final response = await dio.get(ApiEndPoints.getOneUser);
      if (response.data is Map<String, dynamic>) {
        final user = UserDetailsModal.fromJson(response.data);
        emit(state.copyWith(userData: user));
      } else {
        Log.error('Unexpected response format: ${response.data}');
      }
    } catch (e) {
      Log.error(e);
    }
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
        showSuccessToast(msg ?? 'success', '');
        selectionId = response.data['data']['_id'];
        if (context.mounted) {
          Navigator.pushNamed(
            context,
            SelectCollegeFromCourseView.routeName,
            arguments: {
              '_id': selectionId,
            },
          );
          Log.debug("SelectionId ::: $selectionId");
        }
      } else {
        Log.error('Failed to select course: ${response.statusCode}');
        showErrorToast(toastMsg ?? 'An error occurred', '');
      }
    } catch (e) {
      Log.error('Exception during course selection: $e');
      showErrorToast(msg ?? 'An error occurred', '');
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

  void selectRound(String round) {
    emit(state.copyWith(selectedRound: round));
  }
}
