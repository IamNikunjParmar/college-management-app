import 'package:college_management_app/src/components/custom_text.dart';
import 'package:college_management_app/src/interceptor/input_filed.dart';
import 'package:college_management_app/src/logic/auth/edit%20profile/edit_profile_cubit.dart';
import 'package:college_management_app/src/logic/auth/home/home_page_cubit.dart';
import 'package:college_management_app/src/package/data/modal/userDetailsModal/user_details_modal.dart';
import 'package:college_management_app/src/package/helper/validator.dart';
import 'package:college_management_app/src/ui/auth/profile/profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../package/data/modal/userModal/user_modal.dart';
import '../../../package/utils/logger.dart';

class EditProfileView extends StatelessWidget {
  static const String routeName = 'edit_profile_view';
  EditProfileView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(EditProfileState(), context: context),
      child: EditProfileView(),
    );
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserDetailsModal? userData = ModalRoute.of(context)!.settings.arguments as UserDetailsModal?;

    final studentController = TextEditingController(text: userData?.studentName ?? 'data not found');
    final dateOfBirthController = TextEditingController(text: userData?.dateOfBirth ?? 'data not found');
    final courseController = TextEditingController(text: userData?.courseName ?? 'data not found');
    final genderController = TextEditingController(text: userData?.gender ?? 'data not found');
    final mobileNumberController = TextEditingController(text: userData?.phoneNo.toString() ?? 'data not found');
    final castController = TextEditingController(text: userData?.cast ?? 'data not found');
    final fatherNameController = TextEditingController(text: userData?.fatherName ?? 'data not found');
    final motherNameController = TextEditingController(text: userData?.motherName ?? 'data not found');
    final countryController = TextEditingController(text: userData?.country ?? 'data not found');
    final cityController = TextEditingController(text: userData?.city ?? 'data not found');
    final addressController = TextEditingController(text: userData?.address ?? 'data not found');
    final pinCodeController = TextEditingController(text: userData?.pinCode.toString() ?? 'data not found');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Edit Your Profile"),
      ),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (!state.isLoading && state.user != null) {
            // Update UI with state.user data
            studentController.text = state.user?.studentName ?? '';
            dateOfBirthController.text = state.user!.dateOfBirth ?? '';
            courseController.text = state.user!.courseName ?? '';
            genderController.text = state.user!.gender ?? '';
            mobileNumberController.text = state.user!.phoneNo.toString();
            castController.text = state.user!.cast ?? '';
            fatherNameController.text = state.user!.fatherName ?? '';
            motherNameController.text = state.user!.motherName ?? '';
            countryController.text = state.user!.country ?? '';
            cityController.text = state.user!.city ?? '';
            addressController.text = state.user!.address ?? '';
            pinCodeController.text = state.user!.pinCode.toString();

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully!')),
            );
            Navigator.pop(context, state.user);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      title: 'Student Name',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: studentController,
                      validator: validateFullName,
                    ),
                    const Gap(10),
                    const CustomText(
                      title: 'Mobile Number',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: mobileNumberController,
                      validator: validateNumber,
                    ),
                    const Gap(10),
                    const CustomText(
                      title: 'Course Name',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: courseController,
                      validator: validateCourseName,
                      isReadOnly: true,
                    ),
                    const Gap(10),
                    const CustomText(
                      title: 'Cast',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: castController,
                      validator: validateCast,
                    ),
                    const Gap(10),
                    const CustomText(
                      title: 'Father Name',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: fatherNameController,
                      validator: validateFullName,
                    ),
                    const Gap(10),
                    const CustomText(
                      title: 'Mother Name',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: motherNameController,
                      validator: validateFullName,
                    ),
                    const Gap(10),
                    const CustomText(
                      title: 'City',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: cityController,
                      validator: validateCityName,
                    ),
                    const Gap(10),
                    const CustomText(
                      title: 'Country',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: countryController,
                      validator: validateCountryName,
                    ),
                    const Gap(10),
                    const CustomText(
                      title: 'Address',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: addressController,
                      validator: validateAddress,
                    ),
                    const Gap(10),
                    const CustomText(
                      title: 'PinCode',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: pinCodeController,
                      validator: validatePinCode,
                    ),
                    const Gap(10),
                    const CustomText(
                      title: 'Date of Birth',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: dateOfBirthController,
                    ),
                    const Gap(10),
                    const CustomText(
                      title: 'Gender',
                      fontSize: 16,
                      colorName: Colors.blue,
                    ),
                    const Gap(5),
                    CustomTextField(
                      controller: genderController,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          UserDetailsModal updatedUser = UserDetailsModal(
                            studentName: studentController.text,
                            courseName: courseController.text,
                            dateOfBirth: dateOfBirthController.text,
                            gender: genderController.text,
                            phoneNo: int.tryParse(mobileNumberController.text) ?? 0,
                            cast: castController.text,
                            fatherName: fatherNameController.text,
                            motherName: motherNameController.text,
                            country: countryController.text,
                            address: addressController.text,
                            pinCode: int.tryParse(pinCodeController.text) ?? 0,
                            city: cityController.text,
                          );

                          context.read<EditProfileCubit>().editProfileUser(updatedUser);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button color
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: const Text("Save"),
                    ),
                    if (state.isLoading) const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
