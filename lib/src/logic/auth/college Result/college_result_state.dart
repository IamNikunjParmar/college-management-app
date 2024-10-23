part of 'college_result_cubit.dart';

class CollegeResultState extends Equatable {
  final bool isLoading;
  final String? message;
  final String? college;
  final String? selectionId;

  const CollegeResultState({
    this.isLoading = false,
    this.message,
    this.college,
    this.selectionId,
  });

  CollegeResultState copyWith({
    bool? isLoading,
    String? message,
    String? college,
    String? selectionId,
  }) {
    return CollegeResultState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      college: college ?? this.college,
      selectionId: selectionId ?? this.selectionId,
    );
  }

  @override
  List<Object?> get props => [isLoading, message, college, selectionId];
}
