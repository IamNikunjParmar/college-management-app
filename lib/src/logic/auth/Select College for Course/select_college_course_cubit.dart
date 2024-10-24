import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/data/modal/CollegeModal/college_modal.dart';
import 'package:college_management_app/src/ui/auth/college%20Result/college_result_view.dart';
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
      for (var college in collegesData) {
        if (college['collegeId'] == null) {
          Log.error("College ID is null for college: ${college['collegeName']}");
        }
      }

      final collegesIdData = response.data['collegesId'] as List;

      final colleges = collegesData.map((e) => CollegeModal.fromJson(e)).toList();
      final collegesId = collegesIdData.map((e) => e['collegeId'] as String).toList();
      Log.debug("CollegeList :::: $colleges");
      Log.success("CollegeId :::: $collegesId");
      emit(state.copyWith(isLoading: false, collegeList: colleges, selectedCollegeIds: collegesId));
    } catch (e) {
      Log.error("error:  ${e.toString()}");
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> selectCollegesForCourse() async {
    if (state.selectedCollegeIds.length > state.maxCollegeLimit) {
      showErrorToast('Total selected colleges exceed the maximum limit of 5', '');
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
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void toggleCollegeSelection(String collegeId) {
    // Create a copy of the current selection
    final updatedSelectedIds = List<String>.from(state.selectedCollegeIds);

    if (updatedSelectedIds.contains(collegeId)) {
      // If already selected, unselect it
      updatedSelectedIds.remove(collegeId);
    } else {
      // If not selected, add it
      updatedSelectedIds.add(collegeId);
    }

    emit(state.copyWith(selectedCollegeIds: updatedSelectedIds));
  }

  void handleColleges(List<CollegeModal> colleges) {
    for (var college in colleges) {
      if (college.collegeId!.isEmpty) {
        // Log the missing college ID
        print('College ID is null for college: ${college.collegeName}');
      }
    }

    // Store colleges in the state or however you manage them
    emit(state.copyWith(collegeList: colleges));
  }
}

// Future<void> selectColleges() async {
//   if (state.selectedCollegeIds.length > 5) {
//     _showToast('You can select a maximum of 5 colleges', Colors.red, Icons.error);
//     return;
//   }
//   try {
//     emit(state.copyWith(isLoading: true));
//     final response = await dio.post(
//       ApiEndPoints.studentSelectCollege,
//       data: {
//         'selectId': selectionId,
//         'selectedCollegeIds': state.selectedCollegeIds,
//       },
//     );
//     Log.debug(response);
//     emit(state.copyWith(isLoading: false));
//   } catch (e) {
//     Log.error(e.toString());
//   }
// }
//
// void addSelectedCollege(String collegeId) {
//   final updatedSelectedColleges = List<String>.from(state.selectedCollegeIds)..add(collegeId);
//   Log.debug(updatedSelectedColleges);
//   emit(state.copyWith(selectedCollegeIds: updatedSelectedColleges));
// }
//
// void removeSelectedCollege(String collegeId) {
//   final updatedSelectedColleges = List<String>.from(state.selectedCollegeIds)..remove(collegeId);
//   emit(state.copyWith(selectedCollegeIds: updatedSelectedColleges));
// }

/*
getCollegeForCourse
Future<void> getCollegeForCourse() async {
  try {
    emit(state.copyWith(isLoading: true));

    final response = await dio.get(
      ApiEndPoints.getCollegesForCourse,
      queryParameters: {'selectId': selectionId},
    );

    // Handle the response data
    message = response.data['message'] as String?;
    final collegesData = response.data['data'] as List;
    final collegesIdData = response.data['collegesId'] as List;

    final colleges = collegesData.map((e) => CollegeModal.fromJson(e)).toList();
    final collegesId = collegesIdData.map((e) => e['collegeId'] as String).toList();

    // Debugging logs
    Log.debug("CollegeList :::: $colleges");
    Log.success("CollegeId :::: $collegesId");

    // Emit the updated state with colleges and selected IDs synced
    emit(state.copyWith(
      isLoading: false,
      collegeList: colleges,
      selectedCollegeIds: collegesId,  // Ensure this is properly initialized
    ));
  } catch (e) {
    Log.error("error: ${e.toString()}");
    emit(state.copyWith(isLoading: false));
  }
}


// toggle

void toggleCollegeSelection(String collegeId) {
  if (collegeId.isNotEmpty) {
    final updatedSelectedIds = List<String>.from(state.selectedCollegeIds);

    // Toggle selection: add if not selected, remove if selected
    if (updatedSelectedIds.contains(collegeId)) {
      updatedSelectedIds.remove(collegeId);
    } else {
      if (updatedSelectedIds.length < state.maxCollegeLimit) {
        updatedSelectedIds.add(collegeId);
      } else {
        showErrorToast('Total selected colleges exceed the maximum limit of 5', '');
        return;
      }
    }

    // Emit the updated state with the modified selected IDs
    emit(state.copyWith(selectedCollegeIds: updatedSelectedIds));
  } else {
    Log.error('College ID is null. Cannot select college.');
    showErrorToast('College ID is missing. Please try again later.', '');
  }
}

// view
ListView.builder(
  itemCount: state.collegeList.length,
  itemBuilder: (context, index) {
    final college = state.collegeList[index];  // Get the college based on index
    final collegeId = college.id;  // Extract college ID

    // Check if the college is selected
    final isSelected = state.selectedCollegeIds.contains(collegeId);

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            '${index + 1}',  // Display index as a count
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(college.collegeName),
        subtitle: Text(college.courseName),
        trailing: Checkbox(
          value: isSelected,  // Bind checkbox to selection state
          onChanged: (value) {
            if (collegeId != null) {
              context.read<SelectCollegeCourseCubit>().toggleCollegeSelection(collegeId);
            } else {
              Log.error('College ID is null for college: ${college.collegeName}');
              showErrorToast('College ID is missing. Please try again later.', '');
            }
          },
        ),
      ),
    );
  },
);


*/
