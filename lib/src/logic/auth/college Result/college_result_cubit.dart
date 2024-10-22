import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'college_result_state.dart';

class CollegeResultCubit extends Cubit<CollegeResultState> {
  CollegeResultCubit(super.initialState, {required this.context, required this.selectionId}) {
    getCollegeResultData();
  }

  final BuildContext context;
  String? selectionId;

  final DioInterceptors dio = DioInterceptors();

  Future<void> getCollegeResultData() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await dio.get(
        ApiEndPoints.selectCollegeResult,
        queryParameters: {'selectId': selectionId},
      );

      if (response.statusCode == 200) {
        final message = response.data['message'] as String?;
        final college = response.data['college'] as String?;

        emit(state.copyWith(isLoading: false, message: message, college: college));
      } else {
        // Handle error
        Log.error("Error getting college result: ${response.statusMessage}");
        // Show error message to the user
      }
    } catch (e) {
      Log.error("Error: ${e.toString()}");
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
