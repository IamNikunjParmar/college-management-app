import 'dart:developer';

import 'package:college_management_app/src/interceptor/input_filed.dart';
import 'package:college_management_app/src/package/data/modal/getCourseModal/get_course_modal.dart';
import 'package:college_management_app/src/package/utils/images_utils.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:college_management_app/src/ui/auth/student%20Select%20Course/select_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../localization/generated/l10n.dart';
import '../../../logic/auth/home/home_page_cubit.dart';
import '../../../package/helper/validator.dart';
import '../profile/profile_page_view.dart';

class HomePageView extends StatefulWidget {
  static const String routeName = '/home_page_view';

  const HomePageView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(
        const HomePageState(),
        context: context,
      ),
      child: HomePageView(),
    );
  }

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final TextEditingController selectDateController = TextEditingController();
  final TextEditingController roundController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    GetCourseModal? newCourseId = ModalRoute.of(context)!.settings.arguments as GetCourseModal?;
    final l10n = CMLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  ProfilePageView.routeName,
                  (route) => true,
                );
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(ImagePath.profilePic),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Select Course",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(15),
                    Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.25),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomSelectCourse(
                                text: newCourseId?.courseName ?? 'select Your Course',
                                onTap: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    SelectCourseView.routeName,
                                    (route) => true,
                                  );
                                },
                              ),
                              const Gap(10),
                              const Text(
                                "Round",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              CustomTextField(
                                controller: roundController,
                                hintText: 'Enter your Round',
                                validator: validateRound,
                              ),
                              const Gap(10),
                              const Text(
                                "Date",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Gap(10),
                              GestureDetector(
                                onTap: () {
                                  context.read<HomePageCubit>().selectDate(context);
                                },
                                child: Container(
                                  height: 55,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    state.selectedDate == null ? 'Select Date' : '${state.selectedDate}',
                                    style: TextStyle(
                                      color: state.selectedDate == null ? Colors.grey : Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(30),
                              Align(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (globalKey.currentState!.validate()) {
                                      String id = newCourseId?.id ?? '';
                                      Log.info(id);
                                      context.read<HomePageCubit>().studentSelectCourse(
                                            id,
                                            int.parse(roundController.text),
                                            state.selectedDate.toString(),
                                          );
                                    }
                                  },
                                  child: const Text("Continue"),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}

class CustomSelectCourse extends StatelessWidget {
  final String? text;
  final void Function()? onTap;
  const CustomSelectCourse({super.key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        const Text(
          "Select Course",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(5),
        GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(12),
            height: 55,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(text!),
          ),
        ),
      ],
    );
  }
}
