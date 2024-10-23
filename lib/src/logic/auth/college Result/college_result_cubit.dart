import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

part 'college_result_state.dart';

class CollegeResultCubit extends Cubit<CollegeResultState> {
  CollegeResultCubit(super.initialState, {required this.context, required this.selectionId}) {
    getCollegeResultData();
  }

  final BuildContext context;
  String? selectionId;
  String? message;

  final DioInterceptors dio = DioInterceptors();

  Future<void> getCollegeResultData() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.get(
        ApiEndPoints.selectCollegeResult,
        queryParameters: {'selectId': selectionId},
      );
      message = response.data['message'] as String?;
      final college = response.data['college'] as String?;

      if (response.statusCode == 200) {
        _showToast(message ?? '', Colors.green, CupertinoIcons.check_mark_circled_solid);
        emit(state.copyWith(isLoading: false, message: message, college: college, selectionId: selectionId));
      } else {
        Log.error("Error getting college result: ${response.statusMessage}");
        _showToast(message ?? '', Colors.red, Icons.error);
      }
    } catch (e) {
      Log.error("Error re: ${e.toString()}");
      _showToast(message ?? 'Merit not match this colleges.', Colors.red, Icons.error);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
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