import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/data/modal/CollegeModal/college_modal.dart';
import 'package:college_management_app/src/ui/auth/college%20Result/college_result_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../../package/resorces/app_constance.dart';
import '../../../package/utils/logger.dart';

part 'select_college_course_state.dart';

class SelectCollegeCourseCubit extends Cubit<SelectCollegeCourseState> {
  SelectCollegeCourseCubit(super.initialState, {required this.context, required this.selectionId}) {
    getCollegeForCourse();
  }

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();
  String? selectionId;
  String? message;
  final selectedCollegeIds = <String>[];

  Future<void> getCollegeForCourse() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.get(
        ApiEndPoints.getCollegesForCourse,
        queryParameters: {'selectId': selectionId},
      );
      message = response.data['message'] as String?;
      final collegesData = response.data['data'] as List;
      final collegesIdData = response.data['collegesId'] as List;

      // collegeName for CollegeId And CollegeID Missing for this CollegeID NUll
      final colleges = collegesData.map((e) {
        final collegeIdModal =
            collegesIdData.firstWhere((id) => id['collegeName'] == e['collegeName'], orElse: () => {'collegeId': null});
        final collegeNewId = collegeIdModal['collegeId'] as String?;

        if (collegeNewId == null) {
          showErrorToast("College ID is missing for ${e['collegeName']}. Please try again.", '');
        }

        return CollegeModal.fromJson(e..addAll({'collegeId': collegeNewId})); // Add collegeId to the map
      }).toList();

      final collegesId = collegesIdData.map((e) => e['collegeId'] as String).toList();
      Log.debug("CollegeList :::: $colleges");
      Log.success("CollegeId :::: $collegesId");
      emit(state.copyWith(isLoading: false, collegeList: colleges, selectedCollegeIds: collegesId));
    } catch (e) {
      Log.error("error:  ${e.toString()}");
      emit(state.copyWith(isLoading: false));
    }
  }

  void selectCollege(String collegeId) {
    if (selectedCollegeIds.length < 5) {
      if (selectedCollegeIds.contains(collegeId)) {
        selectedCollegeIds.remove(collegeId);
      } else {
        selectedCollegeIds.add(collegeId);
      }
      emit(state.copyWith(selectedCollegeIds: selectedCollegeIds.toList()));
    } else {
      showErrorToast('You can select a maximum of 5 colleges', '');
    }
  }

  Future<void> submitSelectedColleges() async {
    if (selectedCollegeIds.isEmpty) {
      showErrorToast('Please select at least one college', '');
      return;
    }

    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.post(
        ApiEndPoints.studentSelectCollege,
        data: {
          'selectId': selectionId,
          'selectedCollegeIds': selectedCollegeIds,
        },
      );
      if (response.statusCode == 200) {
        if (context.mounted) {
          Navigator.pushNamed(context, CollegeResultView.routeName, arguments: {'_id': selectionId});
        }
      } else {
        Log.error("Error selecting colleges: ${response.statusMessage}");
        showErrorToast(message ?? '', '');
      }
    } catch (e) {
      Log.error("Error: ${e.toString()}");
      showErrorToast('Failed to select colleges', '');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
