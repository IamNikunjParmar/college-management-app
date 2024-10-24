import 'package:college_management_app/src/logic/auth/Select%20College%20for%20Course/select_college_course_cubit.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toastification/toastification.dart';

import '../../../interceptor/interceptors.dart';

class SelectCollegeFromCourseView extends StatelessWidget {
  static const String routeName = "select_college_for_course_view";
  const SelectCollegeFromCourseView({super.key});

  static Widget builder(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final selectionId = args['_id'];

    return BlocProvider(
      create: (context) => SelectCollegeCourseCubit(
        const SelectCollegeCourseState(),
        context: context,
        selectionId: selectionId,
      ),
      child: const SelectCollegeFromCourseView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Select College"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<SelectCollegeCourseCubit, SelectCollegeCourseState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: SpinKitCircle(
                  color: Colors.blue,
                  size: 50.0, // Customize size
                ),
              );
            } else if (state.collegeList.isNotEmpty) {
              return ListView.builder(
                itemCount: state.collegeList.length,
                itemBuilder: (context, index) {
                  final college = state.collegeList[index];
                  final collegeId = college.collegeId;

                  // final collegeId = state.selectedCollegeIds.isNotEmpty ? state.selectedCollegeIds[index] : null;
                  // if (collegeId != null) {
                  //   Log.debug("View::: $collegeId");
                  // } else {
                  //   Log.error("College ID is null for college: $collegeId");
                  // }

                  final isSelected = state.selectedCollegeIds.contains(collegeId);

                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(college.collegeName),
                      subtitle: Text(college.courseName),
                      trailing: Checkbox(
                        value: isSelected, // Bind checkbox to selection state
                        onChanged: (value) {
                          if (collegeId != null) {
                            context.read<SelectCollegeCourseCubit>().toggleCollegeSelection(college.collegeId ?? '');
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
            } else {
              return const Center(child: Text('No colleges found.'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SelectCollegeCourseCubit>().selectCollegesForCourse();
        },
        child: const Icon(
          Icons.check,
          color: Colors.blue,
        ),
      ),
    );
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

/*

ListView.builder(
  itemCount: state.collegeList.length,
  itemBuilder: (context, index) {
    final college = state.collegeList[index];
    final collegeId = college.id;  // Get the college ID

    // Skip rendering if the collegeId is null
    if (collegeId == null) {
      Log.error('College ID is null for college: ${college.collegeName}');
      showErrorToast('College ID is missing for ${college.collegeName}.', '');
      return SizedBox.shrink();  // Render nothing if ID is null
    }

    final isSelected = state.selectedCollegeIds.contains(collegeId);

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            '${index + 1}',  // Display index as count
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(college.collegeName),
        subtitle: Text(college.courseName),
        trailing: Checkbox(
          value: isSelected,  // Bind checkbox to selection state
          onChanged: (value) {
            context.read<SelectCollegeCourseCubit>().toggleCollegeSelection(collegeId);
          },
        ),
      ),
    );
  },
);


*/
