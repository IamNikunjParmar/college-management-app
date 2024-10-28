import 'package:college_management_app/src/logic/auth/logOut%20User/log_out_user_cubit.dart';
import 'package:college_management_app/src/package/data/modal/userDetailsModal/user_details_modal.dart';
import 'package:college_management_app/src/package/resorces/size.dart';
import 'package:college_management_app/src/package/utils/images_utils.dart';

import 'package:college_management_app/src/ui/auth/edit%20profile/edit_profile_view.dart';
import 'package:college_management_app/src/ui/auth/login/login_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../components/input_filed.dart';
import '../../../localization/generated/l10n.dart';
import '../../../logic/auth/profile/profile_page_cubit.dart';

class ProfilePageView extends StatelessWidget {
  static const String routeName = "profile_page_view";

  const ProfilePageView({super.key});

  static Widget builder(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfilePageCubit(const ProfilePageState(), context: context)),
        BlocProvider(create: (context) => LogOutUserCubit(LogOutUserState(), context: context)),
      ],
      child: const ProfilePageView(),
    );
  }

  final bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageCubit, ProfilePageState>(
      builder: (context, state) {
        final userData = state.userData;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Profile'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Center(
                        child: SafeArea(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            child: Image.asset(ImagePath.profilePic),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Text(
                        userData?.studentName ?? 'Loading...',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        userData?.courseName ?? 'Loading...',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userData?.city ?? 'Loading...',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Text(
                            ',',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Text(
                            userData?.country ?? 'Loading...',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      SizedBox(
                        height: 40, // Set the desired height
                        child: OutlinedButton(
                          onPressed: () async {
                            Navigator.pushNamed(
                              context,
                              EditProfileView.routeName,
                              arguments: userData,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          child: Text(CMLocalizations.of(context).editProfile),
                        ),
                      ),
                    ],
                  ),
                  const Gap(Spacing.xxLarge),
                  Text(
                    CMLocalizations.of(context).personalDetails,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                  CustomPersonalDataWidget(userData: userData),
                  const Gap(80),
                  Align(
                    child: SizedBox(
                      height: 40, // Set the desired height
                      child: OutlinedButton(
                        onPressed: () async {
                          final cubit = context.read<LogOutUserCubit>();
                          buildShowDialog(context, userData!, cubit);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: Text(CMLocalizations.of(context).logout),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> buildShowDialog(BuildContext context, UserDetailsModal userData, LogOutUserCubit cubit) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                cubit.logOutUserData(userData);
                Navigator.pushReplacementNamed(context, LoginPageView.routeName);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
