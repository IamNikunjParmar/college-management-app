import 'package:college_management_app/src/components/custom_text.dart';
import 'package:college_management_app/src/package/data/modal/userModal/user_modal.dart';
import 'package:college_management_app/src/logic/auth/register/register_page_cubit.dart';
import 'package:college_management_app/src/package/helper/validator.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../interceptor/input_filed.dart';
import '../../localization/generated/l10n.dart';

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

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDateOfBirth;
    List<String> courses = ['Course A', 'Course B', 'Course C'];

    final l10n = CMLocalizations.of(context);
    return BlocBuilder<RegisterPageCubit, RegisterPageState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomText(
                      title: l10n.studentRegistration,
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
                          title: Text(l10n.generalDetails),
                          content: Form(
                            key: globalKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(20),
                                CustomText(
                                  title: l10n.studentName,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: studentNameController,
                                  autofocus: true,
                                  isReadOnly: true,
                                  hintText: l10n.enterYourName,
                                  validator: validateFullName,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.emailAddress,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                EmailTextField(
                                  hintText: l10n.enterYourEmail,
                                  controller: emailController,
                                  validator: validateEmailAddress,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.password,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                PasswordTextField(
                                  controller: passwordController,
                                  validator: validatePassword,
                                  hintText: l10n.enterYourPassword,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.confirmPassword,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                PasswordTextField(
                                  controller: confirmPasswordController,
                                  hintText: l10n.enterYourConfirmPassword,
                                  validator: (value) => validateConfirmPassword(value, confirmPasswordController.text),
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.mobileNumber,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  validator: validateNumber,
                                  keyBoardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  hintText: l10n.enterYourMobileNumber,
                                  controller: mobileController,
                                  autofocus: true,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.courseName,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: l10n.selectCourse,
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
                                CustomText(
                                  title: l10n.meritRank,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  hintText: l10n.enterYourMeritRank,
                                  controller: meritRankController,
                                  autofocus: true,
                                  isReadOnly: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Personal Details
                        Step(
                          isActive: state.currentStep == 1,
                          title: Text(l10n.personalDetails),
                          content: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: l10n.fatherName,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  hintText: l10n.enterYourFatherName,
                                  autofocus: true,
                                  isReadOnly: true,
                                  controller: fatherController,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.motherName,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  hintText: l10n.enterYourMotherName,
                                  autofocus: true,
                                  isReadOnly: true,
                                  controller: motherController,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.cast,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  autofocus: true,
                                  isReadOnly: true,
                                  controller: studentNameController,
                                  hintText: l10n.enterYourCast,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.city,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  autofocus: true,
                                  isReadOnly: true,
                                  controller: cityController,
                                  hintText: l10n.enterYourCity,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.country,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  autofocus: true,
                                  isReadOnly: true,
                                  hintText: l10n.enterYourCountry,
                                  controller: countryController,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.address,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: addressController,
                                  hintText: l10n.enterYourAddress,
                                  autofocus: true,
                                  isReadOnly: true,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.pinCode,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: pinCodeController,
                                  hintText: l10n.enterYourPinCode,
                                  autofocus: true,
                                  isReadOnly: true,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.annualIncome,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: annualIncomeController,
                                  hintText: l10n.enterYourAnnualIncome,
                                  autofocus: true,
                                  isReadOnly: true,
                                ),
                                const Gap(10),
                                CustomText(
                                  title: l10n.alertNateMobileNumber,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  colorName: Colors.blue,
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: alertNateNumberController,
                                  hintText: l10n.enterYourOptionalNumber,
                                  autofocus: true,
                                  isReadOnly: true,
                                ),
                                const Gap(20),
                                CustomText(
                                  title: l10n.physicallyHandicapped,
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
                                CustomText(
                                  title: l10n.gender,
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
                                CustomText(
                                  title: l10n.dateOfBirth,
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
                        globalKey.currentState!.validate();
                        UserModal user = UserModal(
                          studentName: 'vikas',
                          email: 'nikunjparmar446@gmail.com',
                          password: '12345',
                          phoneNo: 9265456440,
                          courseName: 'CIVIL ENGINEERING',
                          meritRank: 58,
                          fatherName: 'Atulbhai',
                          motherName: 'Dipaben',
                          cast: 'open',
                          city: 'Surat',
                          country: 'India',
                          address: '33,ranchhod nagar',
                          pinCode: 395006,
                          familyAnnualIncome: '18Lakh',
                          physicallyHandicapped: 'no',
                          gender: 'Male',
                          dateOfBirth: '07-11-2001',
                          alternatePhoneNo: null,
                          confirmPassword: '12345',
                        );
                        context.read<RegisterPageCubit>().registerUser(user);
                      },
                      child: Text(l10n.register),
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
