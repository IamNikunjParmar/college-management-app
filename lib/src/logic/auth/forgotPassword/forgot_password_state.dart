part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  final bool isLoading;
  final String msg;

  const ForgotPasswordState({
    this.isLoading = false,
    this.msg = ' ',
  });

  ForgotPasswordState copyWith({bool? isLoading, String? msg}) {
    return ForgotPasswordState(
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
