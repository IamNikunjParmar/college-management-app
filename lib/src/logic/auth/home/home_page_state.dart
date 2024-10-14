part of 'home_page_cubit.dart';

class HomePageState extends Equatable {
  final UserModal? userData;
  final String? msg;
  final List<GetCourseModal> courseList;
  final String selectCourse;
  final bool isLoading;

  const HomePageState({
    this.userData,
    this.selectCourse = '',
    this.courseList = const <GetCourseModal>[],
    this.msg,
    this.isLoading = false,
  });

  HomePageState copyWith({
    UserModal? userData,
    String? msg,
    List<GetCourseModal>? courseList,
    String? selectCourse,
    bool? isLoading,
  }) {
    return HomePageState(
      userData: userData ?? this.userData,
      msg: msg ?? this.msg,
      courseList: courseList ?? this.courseList,
      selectCourse: selectCourse ?? this.selectCourse,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [userData, msg, courseList, selectCourse, isLoading];
}
