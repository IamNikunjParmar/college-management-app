import 'package:college_management_app/src/logic/auth/Select%20College%20for%20Course/select_college_course_cubit.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

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
                child: CircularProgressIndicator(),
              );
            } else if (state.collegeList.isNotEmpty) {
              return ListView.builder(
                itemCount: state.collegeList.length,
                itemBuilder: (context, index) {
                  final college = state.collegeList[index];
                  final isSelected = state.selectedCollegeIds.contains(college.collegeId);
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
                        value: isSelected,
                        onChanged: (value) {
                          if (college.collegeId != null) {
                            context.read<SelectCollegeCourseCubit>().toggleCollegeSelection(college.collegeId!);
                          } else {
                            Log.error('College ID is null for college: ${college.collegeName}');
                            _showToast("College ID is missing. Please try again later.", Colors.red, Icons.error);
                          }
                        },
                      ),

                      // onTap: () {
                      //   if (isSelected) {
                      //     context.read<SelectCollegeCourseCubit>().removeSelectedCollege(college.collegeId!);
                      //   } else {
                      //     context.read<SelectCollegeCourseCubit>().addSelectedCollege(college.collegeId!);
                      //   }
                      // },
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
