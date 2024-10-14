import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/data/modal/getCourseModal/get_course_modal.dart';
import 'package:college_management_app/src/package/data/modal/userModal/user_modal.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(super.initialState, {required this.context}) {
    getCourseList();
  }

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();

  getOneUserData() {}

  Future<void> getCourseList() async {
    try {
      final response = await dio.get(ApiEndPoints.getCourseList);
      List data = (response.data['data'] as List);
      List<GetCourseModal> newData = data.map((e) => GetCourseModal.fromJson(e)).toList();
      emit(state.copyWith(courseList: newData));
    } catch (e) {
      Log.error(e.toString());
    }
  }

  void selectCourse(String newValue) {
    emit(state.copyWith(selectCourse: newValue));
  }

// deleteUserAccount() async {
//   try {
//     final response = await dio.delete(ApiEndPoints.deleteUserAccount, data: {});
//   } catch (e) {}
// }
}

/*
Future<void> getCourseList() async {
  try {
    final response = await dio.get(ApiEndPoints.getCourseList);

    // Check if 'data' is present and is alist
    if (response.data['data'] != null && response.data['data'] is List) {
      List data = response.data['data'] as List;
      List<GetCourseModal> newData = data.map((e) => GetCourseModal.fromJson(e)).toList();
      Log.error(newData);
      emit(state.copyWith(courseList: newData));
    } else {
      // Handle unexpected response format
      Log.warning("Unexpected course list data format");
      emit(state.copyWith(courseList: [])); // Assign an empty listto courseList
    }
  } catch (e) {
    Log.success("==============================================");
    Log.error(e.toString());
    Log.success("==============================================");
    // Handle other errors
    emit(state.copyWith(courseList: [])); // Assign an empty list in case of error
  }
}
*/
