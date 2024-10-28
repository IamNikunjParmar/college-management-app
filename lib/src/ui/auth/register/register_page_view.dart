import 'package:college_management_app/src/components/custom_text.dart';
import 'package:college_management_app/src/package/data/modal/courseModal/course_modal.dart';
import 'package:college_management_app/src/package/data/modal/userModal/user_modal.dart';
import 'package:college_management_app/src/logic/auth/register/register_page_cubit.dart';
import 'package:college_management_app/src/package/helper/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../components/input_filed.dart';
import '../../../localization/generated/l10n.dart';

class RegisterPageView extends StatefulWidget {
  static const String routeName = 'register_page_view';

  const RegisterPageView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterPageCubit(
        const RegisterPageState(),
        context: context,
      ),
      child: const RegisterPageView(),
    );
  }

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  @override
  void initState() {
    super.initState();
    context.read<RegisterPageCubit>().getAllCourse();
  }

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
  final TextEditingController selectedCourseController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = CMLocalizations.of(context);
    return BlocBuilder<RegisterPageCubit, RegisterPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
              title: l10n.studentRegistration,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Form(
                      key: globalKey,
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
                            content: Column(
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
                                  hintText: l10n.enterYourName,
                                  validator: validateFullName,
                                  focusNode: FocusNode(),
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
                                  controller: selectedCourseController,
                                  focusNode: FocusNode(),
                                  validator: validateCourseName,
                                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                                  decoration: InputDecoration(
                                    hintText: l10n.selectCourse,
                                    suffixIcon: DropdownButtonHideUnderline(
                                      child: SizedBox(
                                        width: state.selectCourse == null ? 200 : 400,
                                        child: BlocBuilder<RegisterPageCubit, RegisterPageState>(
                                          builder: (context, state) {
                                            if (state.courseList.isNotEmpty) {
                                              return DropdownButton<String>(
                                                isExpanded: true,
                                                value: state.selectCourse,
                                                iconEnabledColor: Colors.blue,
                                                menuMaxHeight: 400,
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                //menuWidth: 400,
                                                iconSize: 30,
                                                onChanged: (newValue) {
                                                  selectedCourseController.text = newValue!;
                                                  context.read<RegisterPageCubit>().selectCourse(newValue);
                                                },
                                                icon: const Icon(Icons.arrow_drop_down),
                                                style: const TextStyle(color: Colors.black),
                                                underline: Container(
                                                  height: 2,
                                                  color: Colors.blue,
                                                ),
                                                selectedItemBuilder: (BuildContext context) {
                                                  return state.courseList.map<Widget>((CourseModal course) {
                                                    return Padding(
                                                      padding: const EdgeInsets.only(left: 15),
                                                      child: Text(course.courseName),
                                                    );
                                                  }).toList();
                                                },
                                                items: state.courseList
                                                    .map<DropdownMenuItem<String>>((CourseModal course) {
                                                  return DropdownMenuItem<String>(
                                                    alignment: Alignment.centerLeft,
                                                    value: course.courseName,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 15),
                                                      child: Text(course.courseName),
                                                    ),
                                                  );
                                                }).toList(),
                                              );
                                            } else if (state.isLoading) {
                                              return const Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            } else {
                                              return const SizedBox.shrink();
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  // ... other properties ...
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
                                  validator: validateMeritRank,
                                ),
                              ],
                            ),
                          ),
                          // Personal Details
                          Step(
                            isActive: state.currentStep == 1,
                            state: StepState.indexed,
                            title: Text(l10n.personalDetails),
                            content: Column(
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
                                  controller: fatherController,
                                  validator: validateFullName,
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
                                  controller: motherController,
                                  validator: validateFullName,
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
                                  controller: castController,
                                  hintText: l10n.enterYourCast,
                                  validator: validateCast,
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
                                  controller: cityController,
                                  hintText: l10n.enterYourCity,
                                  validator: validateCityName,
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
                                  hintText: l10n.enterYourCountry,
                                  controller: countryController,
                                  validator: validateCountryName,
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
                                  validator: validateAddress,
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
                                  validator: validatePinCode,
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
                                  validator: validateAnnualIncome,
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
                                    Radio<String>(
                                      value: "Yes",
                                      activeColor: Colors.blue,
                                      groupValue: state.isPhysicallyHandicapped,
                                      onChanged: (value) {
                                        context.read<RegisterPageCubit>().selectedPhysicallyHandicapped(value!);
                                      },
                                    ),
                                    const Text('Yes'),
                                    Radio<String>(
                                      value: "No",
                                      activeColor: Colors.blue,
                                      groupValue: state.isPhysicallyHandicapped,
                                      onChanged: (value) {
                                        context.read<RegisterPageCubit>().selectedPhysicallyHandicapped(value!);
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
                                GestureDetector(
                                  onTap: () {
                                    context.read<RegisterPageCubit>().selectDateOfBirth(context);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.blue,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(3, 3),
                                            blurRadius: 5,
                                          ),
                                        ]),
                                    child: Text(
                                      state.selectedDateOfBirth == null ? 'Select DOB' : '${state.selectedDateOfBirth}',
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            UserModal user = UserModal(
                              studentName: studentNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phoneNo: int.parse(mobileController.text),
                              courseName: selectedCourseController.text,
                              meritRank: int.parse(meritRankController.text),
                              fatherName: fatherController.text,
                              motherName: motherController.text,
                              cast: castController.text,
                              city: cityController.text,
                              country: countryController.text,
                              address: addressController.text,
                              pinCode: int.parse(pinCodeController.text),
                              familyAnnualIncome: annualIncomeController.text,
                              physicallyHandicapped: state.isPhysicallyHandicapped,
                              gender: state.selectedGender!,
                              dateOfBirth: state.selectedDateOfBirth.toString(),
                              alternatePhoneNo: null,
                              confirmPassword: confirmPasswordController.text,
                            );
                            context.read<RegisterPageCubit>().registerUser(user, emailController.text.trim());
                          }
                        },
                        child: Center(
                          child: Text(
                            l10n.register,
                          ),
                        ),
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
}
