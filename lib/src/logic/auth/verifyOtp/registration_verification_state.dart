part of 'registration_verification_cubit.dart';

class RegistrationVerificationState extends Equatable {
  final bool verifyOtp;

  const RegistrationVerificationState({this.verifyOtp = false});

  RegistrationVerificationState copyWith({bool? verifyOtp}) {
    return RegistrationVerificationState(
      verifyOtp: verifyOtp ?? this.verifyOtp,
    );
  }

  @override
  List<Object?> get props => [verifyOtp];
}
