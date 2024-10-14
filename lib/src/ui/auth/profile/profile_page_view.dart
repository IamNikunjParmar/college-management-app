import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../logic/auth/profile/profile_page_cubit.dart';

class ProfilePageView extends StatelessWidget {
  static const String routeName = "profile_page_view";
  ProfilePageView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilePageCubit(),
      child: ProfilePageView(),
    );
  }

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("UserName"),
              const Gap(30),
              SizedBox(
                height: 50,
                width: 150,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Edit Profile"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
