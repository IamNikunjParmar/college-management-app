import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/components/user_modal.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'register_page_state.dart';

class RegisterPageCubit extends Cubit<RegisterPageState> {
  RegisterPageCubit(super.initialState, {required this.context}) {
    getAllUser();
  }
  final BuildContext context;

  Future<List> getAllUser() async {
    final DioInterceptors dio = DioInterceptors();
    try {
      final response = await dio.get("${AppConstants.baseUrl}/getAllUser");
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

  Future<void> registerUser(UserModal user) async {
    final DioInterceptors dio = DioInterceptors();
    try {
      final response = await dio.post(
        "${AppConstants.baseUrl}/studentRegistration",
        data: user.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Log.success("User registered successfully");
      } else {
        Log.error("Registration failed: ${response.statusCode}");
      }
    } catch (e) {
      Log.error("Error during registration: $e");
    }
  }

  //In your RegisterPageCubit class
  void selectDateOfBirth(
    BuildContext context,
  ) async {
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

  selectWithGender(String value) {
    emit(state.copyWith(selectedGender: value));
  }

  selectedPhysicallyHandicapped(bool? value) {
    emit(state.copyWith(isPhysicallyHandicapped: value));
  }

  selectCourse(String? newValue) {
    emit(state.copyWith(selectCourse: newValue));
  }

  updateStep(int step) {
    emit(state.copyWith(currentStep: step));
  }

  onStepContinue(int newStep) {
    if (state.currentStep != 1) {
      newStep += 1;
      emit(state.copyWith(currentStep: newStep));
    }
  }

  onStepCancel(int newStep) {
    if (state.currentStep > 0) {
      newStep -= 1;
      emit(state.copyWith(currentStep: newStep));
    }
  }
}
