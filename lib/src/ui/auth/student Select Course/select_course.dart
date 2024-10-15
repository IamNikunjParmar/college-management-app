import 'package:college_management_app/src/logic/auth/home/home_page_cubit.dart';
import 'package:college_management_app/src/logic/auth/student%20select%20Course/select_course_cubit.dart';
import 'package:college_management_app/src/package/data/modal/getCourseModal/get_course_modal.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:college_management_app/src/ui/auth/home/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCourseView extends StatelessWidget {
  static const String routeName = "select_course";

  const SelectCourseView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectCourseCubit(
        const SelectCourseState(),
        context: context,
      ),
      child: const SelectCourseView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Select Your Course"),
        centerTitle: true,
      ),
      body: BlocBuilder<SelectCourseCubit, SelectCourseState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.courseList.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                  itemCount: state.courseList.length,
                  itemBuilder: (context, index) {
                    GetCourseModal newCourse = state.courseList[index];
                    return SizedBox(
                      height: 50,
                      child: Card(
                        child: GestureDetector(
                          onTap: () {
                            Log.debug('tapp');
                            context.read<SelectCourseCubit>().selectCourse(newCourse.courseName);
                            Log.info(newCourse.courseName);

                            Navigator.of(context).pushNamedAndRemoveUntil(
                              HomePageView.routeName,
                              (route) => false,
                              arguments: newCourse,
                            );
                          },
                          child: Text(newCourse.courseName),
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const Center(child: Text("Course Not Found"));
          }
        },
      ),
    );
  }
}
