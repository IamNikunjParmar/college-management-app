part of 'edit_profile_cubit.dart';

class EditProfileState extends Equatable {
  final UserDetailsModal? user;
  final bool isLoading;

  const EditProfileState({this.user, this.isLoading = false});

  EditProfileState copyWith({
    UserDetailsModal? user,
    bool? isLoading,
  }) {
    return EditProfileState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [isLoading, user];
}
