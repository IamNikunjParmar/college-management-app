part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  final bool isLoading;
  final String msg;

  const ResetPasswordState({
    this.isLoading = false,
    this.msg = ' ',
  });

  ResetPasswordState copyWith({bool? isLoading, String? msg}) {
    return ResetPasswordState(
      isLoading: isLoading ?? this.isLoading,
      msg: msg ?? this.msg,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        msg,
      ];
}
