part of 'home_page_cubit.dart';

class HomePageState extends Equatable {
  final UserModal? userData;
  final String? msg;
  final List<GetCourseModal> courseList;
  final String selectCourse;
  final bool isLoading;
  final String? selectedDate;
  final String? errorToastMsg;

  const HomePageState({
    this.userData,
    this.errorToastMsg = '',
    this.selectCourse = '',
    this.courseList = const <GetCourseModal>[],
    this.msg,
    this.isLoading = false,
    this.selectedDate,
  });

  HomePageState copyWith({
    UserModal? userData,
    String? msg,
    List<GetCourseModal>? courseList,
    String? selectCourse,
    bool? isLoading,
    String? selectedDate,
    String? errorToastMsg,
  }) {
    return HomePageState(
      userData: userData ?? this.userData,
      msg: msg ?? this.msg,
      courseList: courseList ?? this.courseList,
      selectCourse: selectCourse ?? this.selectCourse,
      isLoading: isLoading ?? this.isLoading,
      selectedDate: selectedDate ?? this.selectedDate,
      errorToastMsg: errorToastMsg ?? this.errorToastMsg,
    );
  }

  @override
  List<Object?> get props => [
        userData,
        msg,
        courseList,
        selectCourse,
        isLoading,
        selectedDate,
        errorToastMsg,
      ];
}
