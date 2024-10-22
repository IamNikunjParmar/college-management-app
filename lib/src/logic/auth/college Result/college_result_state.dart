part of 'college_result_cubit.dart';

class CollegeResultState extends Equatable {
  final bool isLoading;
  final String? message;
  final String? college;

  const CollegeResultState({
    this.isLoading = false,
    this.message,
    this.college,
  });

  CollegeResultState copyWith({
    bool? isLoading,
    String? message,
    String? college,
  }) {
    return CollegeResultState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      college: college ?? this.college,
    );
  }

  @override
  List<Object?> get props => [isLoading, message, college];
}
