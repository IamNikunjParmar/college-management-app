part of 'login_page_cubit.dart';

class LoginPageState extends Equatable {
  final bool verifyEmail;

  const LoginPageState({this.verifyEmail = false});

  LoginPageState copyWith({bool? verifyEmail}) {
    return LoginPageState(
      verifyEmail: verifyEmail ?? this.verifyEmail,
    );
  }

  @override
  List<Object?> get props => [verifyEmail];
}
