import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/data/modal/CollegeModal/college_modal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../../package/resorces/appConstance.dart';
import '../../../package/utils/logger.dart';

part 'select_college_course_state.dart';

class SelectCollegeCourseCubit extends Cubit<SelectCollegeCourseState> {
  SelectCollegeCourseCubit(super.initialState, {required this.context, required this.selectionId}) {
    getCollegeForCourse();
  }

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();
  String? selectionId;

  Future<void> getCollegeForCourse() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.get(
        ApiEndPoints.getCollegesForCourse,
        queryParameters: {'selectId': selectionId},
      );

      final collegesData = response.data['data'] as List;
      final collegesIdData = response.data['collegesId'] as List;

      final colleges = collegesData.map((e) => CollegeModal.fromJson(e)).toList();
      final collegesId = collegesIdData.map((e) => e['collegeId'] as String).toList();
      Log.debug(colleges);
      Log.success(collegesId);
      emit(state.copyWith(isLoading: false, collegeList: colleges, selectedCollegeIds: collegesId));
    } catch (e) {
      Log.error("error:  ${e.toString()}");
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> selectColleges() async {
    if (state.selectedCollegeIds.length > 5) {
      _showToast('You can select a maximum of 5 colleges', Colors.red, Icons.error);
      return;
    }
    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.post(
        ApiEndPoints.studentSelectCollege,
        data: {
          'selectId': selectionId,
          'selectedCollegeIds': state.selectedCollegeIds,
        },
      );
      Log.debug(response);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      Log.error(e.toString());
    }
  }

  void addSelectedCollege(String collegeId) {
    final updatedSelectedColleges = List<String>.from(state.selectedCollegeIds)..add(collegeId);
    Log.debug(updatedSelectedColleges);
    emit(state.copyWith(selectedCollegeIds: updatedSelectedColleges));
  }

  void removeSelectedCollege(String collegeId) {
    final updatedSelectedColleges = List<String>.from(state.selectedCollegeIds)..remove(collegeId);
    emit(state.copyWith(selectedCollegeIds: updatedSelectedColleges));
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
