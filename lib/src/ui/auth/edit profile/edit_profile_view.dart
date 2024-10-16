import 'package:college_management_app/src/components/custom_text.dart';
import 'package:college_management_app/src/interceptor/input_filed.dart';
import 'package:college_management_app/src/logic/auth/edit%20profile/edit_profile_cubit.dart';
import 'package:college_management_app/src/logic/auth/home/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EditProfileView extends StatelessWidget {
  static const String routeName = 'edit_profile_view';
  EditProfileView({super.key});

  TextEditingController studentController = TextEditingController();

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(EditProfileState(), context: context),
      child: EditProfileView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                title: 'Student Name',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'Email Address',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'Date of Birth',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'Gender',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'Mobile Number',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'Cast',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'Father Name',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'Mother Name',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'Country',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'Address',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'PinCode',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'PhysicallyHandicapped',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(10),
              const CustomText(
                title: 'Annual Income',
                fontSize: 16,
                colorName: Colors.blue,
              ),
              const Gap(5),
              CustomTextField(controller: studentController),
              const Gap(20),
              ElevatedButton(
                onPressed: () {
                  // Handle save action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
