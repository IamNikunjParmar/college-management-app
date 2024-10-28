import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../package/data/modal/getCourseModal/get_course_modal.dart';
import '../../../package/resorces/app_constance.dart';
import '../../../package/utils/logger.dart';

part 'select_course_state.dart';

class SelectCourseCubit extends Cubit<SelectCourseState> {
  SelectCourseCubit(super.initialState, {required this.context}) {
    getCourseList();
  }

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();

  Future<void> getCourseList() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.get(ApiEndPoints.getCourseList);
      if (response.statusCode == 200) {
        List data = (response.data['data'] as List);
        List<GetCourseModal> newData = data.map((e) => GetCourseModal.fromJson(e)).toList();
        emit(state.copyWith(courseList: newData, isLoading: false));
      } else if (response.statusCode == 404) {
        Log.error('API endpoint not found: ${ApiEndPoints.getCourseList}');
      } else {
        Log.error('Other: ${response.statusCode}');
      }
    } catch (e) {
      Log.error(e);
    }
  }

  void selectCourse(String newValue) {
    emit(state.copyWith(selectCourse: newValue));
  }
}
