import 'package:college_management_app/src/components/custom_text.dart';
import 'package:college_management_app/src/components/user_modal.dart';
import 'package:college_management_app/src/logic/auth/register/register_page_cubit.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../interceptor/input_filed.dart';

class RegisterPageView extends StatelessWidget {
  static const String routeName = 'register_page_view';
  RegisterPageView({super.key});
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController meritRankController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  final TextEditingController motherController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController annualIncomeController = TextEditingController();
  final TextEditingController alertNateNumberController = TextEditingController();
  final TextEditingController castController = TextEditingController();

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterPageCubit(
        const RegisterPageState(),
        context: context,
      ),
      child: RegisterPageView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDateOfBirth;
    List<String> courses = ['Course A', 'Course B', 'Course C'];
    return BlocBuilder<RegisterPageCubit, RegisterPageState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CustomText(
                      title: 'Student Registration',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Stepper(
                      elevation: 5,
                      type: StepperType.horizontal,
                      connectorColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.blue;
                        } else {
                          return Colors.grey;
                        }
                      }),
                      currentStep: state.currentStep,
                      onStepTapped: (value) {
                        context.read<RegisterPageCubit>().updateStep(value);
                      },
                      onStepContinue: () {
                        context.read<RegisterPageCubit>().onStepContinue(state.currentStep);
                      },
                      onStepCancel: () {
                        context.read<RegisterPageCubit>().onStepCancel(state.currentStep);
                      },
                      steps: [
                        // General Details
                        Step(
                          isActive: state.currentStep == 0,
                          state: StepState.indexed,
                          title: const Text('General Details'),
                          content: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(20),
                                const CustomText(
                                  title: 'StudentName',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: studentNameController,
                                  autofocus: true,
                                  isReadOnly: true,
                                  labelText: 'Enter your student Name',
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Email Address',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: emailController,
                                  autofocus: true,
                                  isReadOnly: true,
                                  labelText: 'Enter your Email',
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Password',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: passwordController,
                                  autofocus: true,
                                  isReadOnly: true,
                                  labelText: 'Enter your Password',
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Confirm Password',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: confirmPasswordController,
                                  autofocus: true,
                                  isReadOnly: true,
                                  labelText: 'Enter your Confirm Password',
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Mobile Number',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: mobileController,
                                  autofocus: true,
                                  isReadOnly: true,
                                  labelText: 'Enter your Mobile Number',
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Course Name',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                TextFormField(
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    labelText: state.selectCourse == null ? 'Select Course' : '',
                                    suffixIcon: DropdownButtonHideUnderline(
                                      child: SizedBox(
                                        width: state.selectCourse == null ? 200 : 400,
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: state.selectCourse,
                                          onChanged: (String? newValue) {
                                            context.read<RegisterPageCubit>().selectCourse(newValue);
                                          },
                                          items: courses.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              alignment: Alignment.centerLeft,
                                              value: value,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 15),
                                                child: Text(value),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Merit Rank',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: meritRankController,
                                  autofocus: true,
                                  isReadOnly: true,
                                  labelText: 'Enter your Merit rank',
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Personal Details
                        Step(
                          isActive: state.currentStep == 1,
                          title: const Text('Personal Details'),
                          content: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  title: 'Father\'s Name',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  autofocus: true,
                                  isReadOnly: true,
                                  controller: fatherController,
                                  labelText: 'Enter your father\'s name',
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Mother\'s Name',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  autofocus: true,
                                  isReadOnly: true,
                                  controller: motherController,
                                  labelText: 'Enter your mother\'s name',
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Cast',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  autofocus: true,
                                  isReadOnly: true,
                                  controller: studentNameController,
                                  labelText: 'Enter your cast',
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'City',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  autofocus: true,
                                  isReadOnly: true,
                                  controller: cityController,
                                  labelText: 'Enter your city',
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Country',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  autofocus: true,
                                  isReadOnly: true,
                                  labelText: 'Enter your Country',
                                  controller: countryController,
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Address',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: addressController,
                                  labelText: 'Enter your address',
                                  autofocus: true,
                                  isReadOnly: true,
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Pin Code',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: pinCodeController,
                                  labelText: 'Enter your pin code',
                                  autofocus: true,
                                  isReadOnly: true,
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Annual Income',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: annualIncomeController,
                                  labelText: 'Enter your Annual Income',
                                  autofocus: true,
                                  isReadOnly: true,
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'AlertNate Mobile Number',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: alertNateNumberController,
                                  labelText: 'Enter your Mobile Number',
                                  autofocus: true,
                                  isReadOnly: true,
                                ),
                                const Gap(20),
                                const CustomText(
                                  title: 'Physically Handicapped',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                Row(
                                  children: [
                                    Radio<bool>(
                                      value: true,
                                      activeColor: Colors.blue,
                                      groupValue: state.isPhysicallyHandicapped,
                                      onChanged: (bool? value) {
                                        context.read<RegisterPageCubit>().selectedPhysicallyHandicapped(value);
                                      },
                                    ),
                                    const Text('Yes'),
                                    Radio<bool>(
                                      value: false,
                                      activeColor: Colors.blue,
                                      groupValue: state.isPhysicallyHandicapped,
                                      onChanged: (bool? value) {
                                        context.read<RegisterPageCubit>().selectedPhysicallyHandicapped(value);
                                      },
                                    ),
                                    const Text('No'),
                                  ],
                                ),
                                const Gap(20),
                                const CustomText(
                                  title: 'Gender',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Male',
                                      activeColor: Colors.blue,
                                      groupValue: state.selectedGender,
                                      onChanged: (value) {
                                        context.read<RegisterPageCubit>().selectWithGender(value!);
                                      },
                                    ),
                                    const Text('Male'),
                                    Radio<String>(
                                      value: 'Female',
                                      activeColor: Colors.blue,
                                      groupValue: state.selectedGender,
                                      onChanged: (value) {
                                        context.read<RegisterPageCubit>().selectWithGender(value!);
                                      },
                                    ),
                                    const Text('Female'),
                                  ],
                                ),
                                const Gap(10),
                                const CustomText(
                                  title: 'Date of Birth',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                SizedBox(
                                  width: 400,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)),
                                    onPressed: () {
                                      // final DateTime? pickedDate = await showDatePicker(
                                      //   context: context,
                                      //   initialDate: selectedDateOfBirth ?? DateTime.now(),
                                      //   firstDate: DateTime(1900),
                                      //   lastDate: DateTime.now(),
                                      // );
                                      // if (pickedDate != null && pickedDate != selectedDateOfBirth) {
                                      //   // setState(() {
                                      //   //   selectedDateOfBirth = pickedDate;
                                      //   // });
                                      //   context.read<RegisterPageCubit>().selectDateOfBirth(context);
                                      // }
                                      context.read<RegisterPageCubit>().selectDateOfBirth(context);
                                    },
                                    child: Text(
                                      state.selectedDateOfBirth == null
                                          ? 'Select Date of Birth'
                                          : '${state.selectedDateOfBirth}',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Log.error(mobileController.text.trim());
                        UserModal user = UserModal(
                          studentName: studentNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phoneNo: 9265745540,
                          courseName: state.selectCourse.toString(),
                          meritRank: 56,
                          fatherName: fatherController.text,
                          motherName: motherController.text,
                          cast: castController.text,
                          city: cityController.text,
                          country: countryController.text,
                          address: addressController.text,
                          pinCode: 455656,
                          familyAnnualIncome: annualIncomeController.text,
                          physicallyHandicapped: state.isPhysicallyHandicapped.toString(),
                          gender: state.selectedGender.toString(),
                          dateOfBirth: state.selectedDateOfBirth!,
                        );
                        context.read<RegisterPageCubit>().registerUser(user);
                      },
                      child: const Text(" Register"),
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
}

// TODO: General details
/*
student name
email and password and confirm
mobile number
course name
meritRank

// TODO: personal Details

gender
dob
father and mother name
cast
city
country
address
pinCode
familyAnnualIncome
physicallyHandicapped
alternatePhoneNo

 */
