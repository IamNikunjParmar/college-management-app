import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/package/data/modal/courseModal/course_modal.dart';
import 'package:college_management_app/src/package/data/modal/userModal/user_modal.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/app_constance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../ui/auth/verifyOtp/registration_verification.dart';

part 'register_page_state.dart';

class RegisterPageCubit extends Cubit<RegisterPageState> {
  RegisterPageCubit(super.initialState, {required this.context}) {
    getAllUser();
  }

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();

  Future<List> getAllUser() async {
    try {
      final response = await dio.get(ApiEndPoints.getAllUser);
      List allUser = (response.data as List);
      List<UserModal> newAllUser = allUser.map((e) => UserModal.fromJson(e)).toList();
      Log.success("allUser : ${newAllUser.length}");
      emit(state.copyWith(userList: newAllUser));
      return allUser;
    } catch (e) {
      Log.error(e);
      rethrow;
    }
  }

  Future<List?> getAllCourse() async {
    try {
      final response = await dio.get(ApiEndPoints.getAllCourse);
      List<CourseModal> newAllCourse = [];
      if (response.statusCode == 200) {
        List allCourse = (response.data as List);
        newAllCourse = allCourse.map((e) => CourseModal.fromJson(e)).toList();
        Log.success("AllCourse : ${newAllCourse.length}");
        emit(state.copyWith(courseList: newAllCourse));
      } else if (response.statusCode == 404) {
        Log.error('API endpoint not found: ${ApiEndPoints.getAllCourse}');
      } else {
        Log.error('Other: ${response.statusCode}');
      }

      return newAllCourse;
    } catch (e) {
      Log.error(e);
    }
    return null;
  }

  Future<void> registerUser(UserModal user, Object? arguments) async {
    final DioInterceptors dio = DioInterceptors();
    try {
      emit(state.copyWith(isLoading: true));
      Log.info("Enter");
      final response = await dio.post(
        ApiEndPoints.studentRegistration,
        data: user.toJson(),
      );
      Log.debug(user.toJson());

      Log.info(response);
      final msg = response.data['message'];

      if (response.statusCode == 200 || response.statusCode == 201) {
        Log.success("User registered successfully");
        showSuccessToast(msg, "");
        if (context.mounted) {
          Navigator.of(context).pushNamed(
            RegistrationVerification.routeName,
            arguments: arguments,
          );
        }
      } else if (response.statusCode == 409) {
        Log.error("Registration failed: Email or phone number already exists");
        showErrorToast(msg ?? 'Email already exists', '');
      } else {
        Log.error("Registration failed: ${response.statusCode}");
        showErrorToast("Registration failed", '');
        Log.error(response);
      }
    } catch (e) {
      Log.error("Error during registration: $e");
      Log.error(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void selectDateOfBirth(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    String date = DateFormat('dd-MM-yyyy').format(pickedDate!);
    Log.success(date);
    emit(state.copyWith(selectedDateOfBirth: date));
  }

  void selectWithGender(String value) {
    emit(state.copyWith(selectedGender: value));
  }

  void selectedPhysicallyHandicapped(String value) {
    emit(state.copyWith(isPhysicallyHandicapped: value));
  }

  void selectCourse(String newValue) {
    emit(state.copyWith(selectCourse: newValue));
  }

  void updateStep(int step) {
    emit(state.copyWith(currentStep: step));
  }

  void onStepContinue(int newStep) {
    if (state.currentStep != 1) {
      newStep += 1;
      emit(state.copyWith(currentStep: newStep));
    }
  }

  void onStepCancel(int newStep) {
    if (state.currentStep > 0) {
      newStep -= 1;
      emit(state.copyWith(currentStep: newStep));
    }
  }
}
