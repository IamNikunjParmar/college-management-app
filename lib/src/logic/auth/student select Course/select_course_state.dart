part of 'select_course_cubit.dart';

class SelectCourseState extends Equatable {
  final String selectCourse;
  final List<GetCourseModal> courseList;
  final bool isLoading;

  const SelectCourseState({this.selectCourse = '', this.courseList = const <GetCourseModal>[], this.isLoading = false});

  SelectCourseState copyWith({String? selectCourse, List<GetCourseModal>? courseList, bool? isLoading}) {
    return SelectCourseState(
      selectCourse: selectCourse ?? this.selectCourse,
      courseList: courseList ?? this.courseList,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [selectCourse, courseList, isLoading];
}
