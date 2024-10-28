part of 'profile_page_cubit.dart';

class ProfilePageState extends Equatable {
  final UserDetailsModal? userData;

  const ProfilePageState({this.userData});

  ProfilePageState copyWith({UserDetailsModal? userData}) {
    return ProfilePageState(userData: userData ?? this.userData);
  }

  @override
  List<Object?> get props => [userData];
}
