import 'package:college_management_app/src/components/custom_text.dart';
import 'package:college_management_app/src/components/input_filed.dart';
import 'package:college_management_app/src/logic/auth/edit%20profile/edit_profile_cubit.dart';
import 'package:college_management_app/src/package/data/modal/userDetailsModal/user_details_modal.dart';
import 'package:college_management_app/src/package/helper/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';


class EditProfileView extends StatelessWidget {
  static const String routeName = 'edit_profile_view';
  EditProfileView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(const EditProfileState(), context: context),
      child: EditProfileView(),
    );
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserDetailsModal? userData = ModalRoute.of(context)!.settings.arguments as UserDetailsModal?;

    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully!')),
        );
      },
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          final updatedUserData = state.user ?? userData;
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
            body: Padding(
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
                              id: updatedUserData!.id,
                              studentName: studentController.text.trim(),
                              courseName: courseController.text.trim(),
                              dateOfBirth: dateOfBirthController.text.trim(),
                              gender: genderController.text.trim(),
                              phoneNo: int.tryParse(mobileNumberController.text.trim()) ?? 0,
                              cast: castController.text.trim(),
                              fatherName: fatherNameController.text.trim(),
                              motherName: motherNameController.text.trim(),
                              country: countryController.text.trim(),
                              address: addressController.text.trim(),
                              pinCode: int.tryParse(pinCodeController.text.trim()) ?? 0,
                              city: cityController.text.trim(),
                            );

                            context.read<EditProfileCubit>().editProfileUser(updatedUser);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: state.isLoading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : const Text("Save"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
