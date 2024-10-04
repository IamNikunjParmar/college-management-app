import 'package:college_management_app/src/components/custom_text.dart';
import 'package:college_management_app/src/logic/auth/register/register_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../interceptor/input_filed.dart';

class RegisterPageView extends StatelessWidget {
  RegisterPageView({super.key});

  static const String routeName = 'register_page_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterPageCubit(),
      child: RegisterPageView(),
    );
  }

  TextEditingController studentNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        type: StepperType.horizontal,
                        connectorColor: WidgetStateProperty.all(Colors.blue),
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
                                  ),
                                  const Gap(5),
                                  CustomTextField(
                                    controller: studentNameController,
                                    autofocus: true,
                                    isReadOnly: true,
                                    labelText: 'Enter your Email',
                                  ),
                                  const Gap(10),
                                  const CustomText(
                                    title: 'Password',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const Gap(5),
                                  CustomTextField(
                                    controller: studentNameController,
                                    autofocus: true,
                                    isReadOnly: true,
                                    labelText: 'Enter your Password',
                                  ),
                                  const Gap(10),
                                  const CustomText(
                                    title: 'Confirm Password',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const Gap(5),
                                  CustomTextField(
                                    controller: studentNameController,
                                    autofocus: true,
                                    isReadOnly: true,
                                    labelText: 'Enter your Confirm Password',
                                  ),
                                  const Gap(10),
                                  const CustomText(
                                    title: 'Mobile Number',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const Gap(5),
                                  CustomTextField(
                                    controller: studentNameController,
                                    autofocus: true,
                                    isReadOnly: true,
                                    labelText: 'Enter your Mobile Number',
                                  ),
                                  const Gap(10),
                                  const CustomText(
                                    title: 'Course Name',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const Gap(5),
                                  DropdownButton(items: const [
                                    DropdownMenuItem(
                                      child: Text("fdvf"),
                                    ),
                                  ], onChanged: (val) {}),
                                ],
                              ),
                            ),
                          ),
                          Step(
                            isActive: state.currentStep == 1,
                            title: const Text('Personal Details'),
                            content: const Form(
                              child: Column(
                                children: [
                                  Text("Personal detyail"),
                                ],
                              ),
                            ),
                          ),
                        ]),
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
