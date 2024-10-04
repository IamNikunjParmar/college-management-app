part of 'register_page_cubit.dart';

class RegisterPageState extends Equatable {
  final int currentStep;
  const RegisterPageState({required this.currentStep});

  RegisterPageState copyWith({int? currentStep}) {
    return RegisterPageState(
      currentStep: currentStep ?? this.currentStep,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [currentStep];
}
