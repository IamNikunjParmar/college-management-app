part of 'register_page_cubit.dart';

class RegisterPageState extends Equatable {
  final int currentStep;
  final String? selectCourse;
  final bool? isPhysicallyHandicapped;
  final String? selectedGender;
  final List<UserModal> userList;
  final String? selectedDateOfBirth;

  const RegisterPageState({
    this.selectedGender,
    this.selectCourse,
    this.selectedDateOfBirth,
    this.isPhysicallyHandicapped,
    this.currentStep = 0,
    this.userList = const <UserModal>[],
  });

  RegisterPageState copyWith({
    String? selectedGender,
    int? currentStep,
    bool? isPhysicallyHandicapped,
    String? selectCourse,
    List<UserModal>? userList,
    String? selectedDateOfBirth,
  }) {
    return RegisterPageState(
      selectCourse: selectCourse ?? this.selectCourse,
      currentStep: currentStep ?? this.currentStep,
      isPhysicallyHandicapped: isPhysicallyHandicapped ?? this.isPhysicallyHandicapped,
      selectedGender: selectedGender ?? this.selectedGender,
      userList: userList ?? this.userList,
      selectedDateOfBirth: selectedDateOfBirth ?? this.selectedDateOfBirth,
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
      ];
}
