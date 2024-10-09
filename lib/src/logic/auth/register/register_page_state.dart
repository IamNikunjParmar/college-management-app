part of 'register_page_cubit.dart';

class RegisterPageState extends Equatable {
  final int currentStep;
  final String? selectCourse;
  final String isPhysicallyHandicapped;
  final String? selectedGender;
  final List<UserModal> userList;
  final String? selectedDateOfBirth;
  final List<CourseModal> courseList;
  final bool isLoading;

  const RegisterPageState({
    this.selectedGender,
    this.isLoading = false,
    this.selectCourse,
    this.selectedDateOfBirth,
    this.isPhysicallyHandicapped = '',
    this.currentStep = 0,
    this.userList = const <UserModal>[],
    this.courseList = const <CourseModal>[],
  });

  RegisterPageState copyWith({
    String? selectedGender,
    int? currentStep,
    String? isPhysicallyHandicapped,
    String? selectCourse,
    List<UserModal>? userList,
    String? selectedDateOfBirth,
    List<CourseModal>? courseList,
    bool? isLoading,
  }) {
    return RegisterPageState(
      selectCourse: selectCourse ?? this.selectCourse,
      currentStep: currentStep ?? this.currentStep,
      isPhysicallyHandicapped: isPhysicallyHandicapped ?? this.isPhysicallyHandicapped,
      selectedGender: selectedGender ?? this.selectedGender,
      userList: userList ?? this.userList,
      selectedDateOfBirth: selectedDateOfBirth ?? this.selectedDateOfBirth,
      courseList: courseList ?? this.courseList,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        currentStep,
        selectCourse,
        isPhysicallyHandicapped,
        selectedGender,
        userList,
        selectedDateOfBirth,
        isLoading,
      ];
}
