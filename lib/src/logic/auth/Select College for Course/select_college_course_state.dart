part of 'select_college_course_cubit.dart';

class SelectCollegeCourseState extends Equatable {
  final bool isLoading;
  final List<CollegeModal> collegeList;
  final List<String> selectedCollegeIds;

  const SelectCollegeCourseState(
      {this.isLoading = false, this.collegeList = const <CollegeModal>[], this.selectedCollegeIds = const []});

  SelectCollegeCourseState copyWith(
      {bool? isLoading, List<CollegeModal>? collegeList, List<String>? selectedCollegeIds}) {
    return SelectCollegeCourseState(
      isLoading: isLoading ?? this.isLoading,
      collegeList: collegeList ?? this.collegeList,
      selectedCollegeIds: selectedCollegeIds ?? this.selectedCollegeIds,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        collegeList,
        selectedCollegeIds,
      ];
}
