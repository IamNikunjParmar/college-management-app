import 'package:college_management_app/src/logic/auth/Select%20College%20for%20Course/select_college_course_cubit.dart';
import 'package:college_management_app/src/package/resorces/colors.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  final collegeId = college.collegeId;
                  Log.info("View::::${college.collegeName}");

                  if (collegeId != null) {
                    Log.debug("View::::$collegeId");
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(8),
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: state.selectedCollegeIds.contains(collegeId) ? Colors.grey.shade300 : Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 5,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          context.read<SelectCollegeCourseCubit>().selectCollege(collegeId);
                        },
                        child: ListTile(
                          title: Text(
                            college.collegeName,
                            style: const TextStyle(),
                          ),
                          subtitle: Text(college.courseName),
                          trailing: state.selectedCollegeIds.contains(collegeId)
                              ? const Icon(Icons.check, color: Colors.green)
                              : const SizedBox.shrink(),
                        ),
                      ),
                    );
                  } else {
                    Log.error("College ID is null for college: ${college.collegeName}");
                    return const SizedBox.shrink();
                  }
                },
              );
            } else {
              return const Center(child: Text('No colleges found.'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlue,
        onPressed: () {
          context.read<SelectCollegeCourseCubit>().submitSelectedColleges();
        },
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
