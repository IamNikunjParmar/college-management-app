import 'dart:developer';

import 'package:college_management_app/src/package/data/modal/getCourseModal/get_course_modal.dart';
import 'package:college_management_app/src/package/utils/images_utils.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../localization/generated/l10n.dart';
import '../../../logic/auth/home/home_page_cubit.dart';
import '../../../package/helper/validator.dart';
import '../profile/profile_page_view.dart';

class HomePageView extends StatelessWidget {
  static const String routeName = '/home_page_view';

  HomePageView({super.key});

  final TextEditingController selectedCourseController = TextEditingController();

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
  Widget build(BuildContext context) {
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
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<HomePageCubit>().getCourseList();
                      },
                      child: const Text("click")),
                  const Gap(10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("deleteUser"),
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: selectedCourseController,
                    focusNode: FocusNode(),
                    validator: validateCourseName,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      hintText: l10n.selectCourse,
                      suffixIcon: DropdownButtonHideUnderline(
                        child: SizedBox(
                          width: 100,
                          child: DropdownButton(
                              isExpanded: true,
                              value: state.courseList.length,
                              // Use selectedCourse instead of mapping
                              iconEnabledColor: Colors.blue,
                              menuMaxHeight: 400,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              iconSize: 30,
                              onChanged: (newValue) {
                                selectedCourseController.text = newValue!;
                                context.read<HomePageCubit>().selectCourse(newValue);
                              },
                              icon: const Icon(Icons.arrow_drop_down),
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.blue,
                              ),
                              // selectedItemBuilder: (BuildContext context) {
                              //   return state.courseList.map((e) {
                              //     Log.success("=========================");
                              //     Log.error(e);
                              //     Log.success("=========================");
                              //     return Padding(
                              //       padding: const EdgeInsets.only(left: 15),
                              //       child: Text(e.courseName),
                              //     );
                              //   }).toList();
                              // },
                              // items: state.courseList.map((GetCourseModal course) {
                              //   return DropdownMenuItem<String>(
                              //     alignment: Alignment.centerLeft,
                              //     value: course.courseName, // Use courseName as the unique value
                              //     child: Padding(
                              //       padding: const EdgeInsets.only(left: 15),
                              //       child: Text(course.courseName),
                              //     ),
                              //   );
                              // }).toList(),
                              items: [
                                DropdownMenuItem(child: Text("data")),
                                DropdownMenuItem(child: Text("data")),
                                DropdownMenuItem(child: Text("data")),
                                DropdownMenuItem(child: Text("data")),
                                DropdownMenuItem(child: Text("data")),
                                DropdownMenuItem(child: Text("data")),
                              ]),
                        ),
                      ),
                    ),
                    // ... other properties ...
                  ),
                  // TextFormField(
                  //   controller: selectedCourseController,
                  //   focusNode: FocusNode(),
                  //   validator: validateCourseName,
                  //   onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  //   decoration: InputDecoration(
                  //     hintText: l10n.selectCourse,
                  //     suffixIcon: DropdownButtonHideUnderline(
                  //       child: SizedBox(
                  //         width: state.selectCourse == null ? 200 : 400,
                  //         child: DropdownButton<String>(
                  //           isExpanded: true,
                  //           value: state.courseList.map((e) => e.courseName).toString(),
                  //           iconEnabledColor: Colors.blue,
                  //           menuMaxHeight: 400,
                  //           borderRadius: const BorderRadius.all(
                  //             Radius.circular(10),
                  //           ),
                  //           //menuWidth: 400,
                  //           iconSize: 30,
                  //           onChanged: (newValue) {
                  //             selectedCourseController.text = newValue!;
                  //             context.read<HomePageCubit>().selectCourse(newValue);
                  //           },
                  //           icon: const Icon(Icons.arrow_drop_down),
                  //           style: const TextStyle(color: Colors.black),
                  //           underline: Container(
                  //             height: 2,
                  //             color: Colors.blue,
                  //           ),
                  //           selectedItemBuilder: (BuildContext context) {
                  //             return state.courseList.map((e) {
                  //               return Padding(
                  //                 padding: const EdgeInsets.only(left: 15),
                  //                 child: Text(e.courseName),
                  //               );
                  //             }).toList();
                  //           },
                  //           items: state.courseList.map<DropdownMenuItem<String>>((GetCourseModal course) {
                  //             Log.debug(course);
                  //             return DropdownMenuItem<String>(
                  //               alignment: Alignment.centerLeft,
                  //               value: state.courseList
                  //                   .map(
                  //                     (e) => e.courseName,
                  //                   )
                  //                   .toString(),
                  //               child: Padding(
                  //                 padding: const EdgeInsets.only(left: 15),
                  //                 child: Text(course.courseName),
                  //               ),
                  //             );
                  //           }).toList(),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //   // ... other properties ...
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
/*Expanded(
              child: BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  return ListView.builder(
                      itemCount: state.courseList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.only(top: 15),
                          child: Text(state.courseList[index].id),
                        );
                      });
                },
              ),
            ),*/

/*BlocBuilder<HomePageCubit, HomePageState>(
                            builder: (context, state) {
                              if (state.courseList.isNotEmpty) {
                                return DropdownButton<String>(
                                  isExpanded: true,
                                  value: state.courseList.map((e) => e.courseName).toString(),
                                  iconEnabledColor: Colors.blue,
                                  menuMaxHeight: 400,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  //menuWidth: 400,
                                  iconSize: 30,
                                  onChanged: (newValue) {
                                    selectedCourseController.text = newValue!;
                                    context.read<HomePageCubit>().selectCourse(newValue);
                                  },
                                  icon: const Icon(Icons.arrow_drop_down),
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.blue,
                                  ),
                                  selectedItemBuilder: (BuildContext context) {
                                    return state.courseList.map((e) {
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Text(e.courseName),
                                      );
                                    }).toList();
                                  },
                                  items: state.courseList.map<DropdownMenuItem<String>>((GetCourseModal course) {
                                    Log.debug(course);
                                    return DropdownMenuItem<String>(
                                      alignment: Alignment.centerLeft,
                                      value: state.courseList
                                          .map(
                                            (e) => e.courseName,
                                          )
                                          .toString(),
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
                          ),*/
