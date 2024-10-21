part of 'home_page_cubit.dart';

class HomePageState extends Equatable {
  final UserDetailsModal? userData;
  final String? msg;
  final List<GetCourseModal> courseList;
  final String selectCourse;
  final bool isLoading;
  final String? selectedDate;
  final String? errorToastMsg;
  final String selectedRound;

  const HomePageState({
    this.selectedRound = '1',
    this.userData,
    this.errorToastMsg = '',
    this.selectCourse = '',
    this.courseList = const <GetCourseModal>[],
    this.msg,
    this.isLoading = false,
    this.selectedDate,
  });

  HomePageState copyWith({
    UserDetailsModal? userData,
    String? msg,
    List<GetCourseModal>? courseList,
    String? selectCourse,
    bool? isLoading,
    String? selectedDate,
    String? errorToastMsg,
    String? selectedRound,
  }) {
    return HomePageState(
      userData: userData ?? this.userData,
      msg: msg ?? this.msg,
      courseList: courseList ?? this.courseList,
      selectCourse: selectCourse ?? this.selectCourse,
      isLoading: isLoading ?? this.isLoading,
      selectedDate: selectedDate ?? this.selectedDate,
      errorToastMsg: errorToastMsg ?? this.errorToastMsg,
      selectedRound: selectedRound ?? this.selectedRound,
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
        selectedRound,
      ];
}
