import 'package:college_management_app/src/logic/auth/register/register_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoHome extends StatelessWidget {
  const DemoHome({super.key});

  static const String routeName = 'demo_home';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterPageCubit(const RegisterPageState(), context: context),
      child: const DemoHome(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterPageCubit, RegisterPageState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView.builder(
              itemCount: state.userList.length,
              itemBuilder: (ctx, index) {
                var newUser = state.userList[index];
                return ListTile(
                  title: Text(newUser.studentName),
                );
              }),
        );
      },
    );
  }
}
