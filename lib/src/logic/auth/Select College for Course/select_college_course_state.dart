part of 'select_college_course_cubit.dart';

class SelectCollegeCourseState extends Equatable {
  final bool isLoading;
  final List<CollegeModal> collegeList;
  final List<String> selectedCollegeIds;
  final int maxCollegeLimit;

  const SelectCollegeCourseState(
      {this.isLoading = false,
      this.collegeList = const <CollegeModal>[],
      this.selectedCollegeIds = const [],
      this.maxCollegeLimit = 5});

  SelectCollegeCourseState copyWith(
      {bool? isLoading, List<CollegeModal>? collegeList, List<String>? selectedCollegeIds, int? maxCollegeLimit}) {
    return SelectCollegeCourseState(
      isLoading: isLoading ?? this.isLoading,
      collegeList: collegeList ?? this.collegeList,
      selectedCollegeIds: selectedCollegeIds ?? this.selectedCollegeIds,
      maxCollegeLimit: maxCollegeLimit ?? this.maxCollegeLimit,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        collegeList,
        selectedCollegeIds,
        maxCollegeLimit,
      ];
}
