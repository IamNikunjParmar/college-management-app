import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/auth/college Result/college_result_cubit.dart';

class CollegeResultView extends StatelessWidget {
  static const String routeName = "college_result_view";
  const CollegeResultView({super.key});

  static Widget builder(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final selectionId = args['_id'];

    return BlocProvider(
      create: (context) => CollegeResultCubit(
        CollegeResultState(),
        context: context,
        selectionId: selectionId,
      ),
      child: const CollegeResultView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("College result"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<CollegeResultCubit, CollegeResultState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.message != null || state.college != null) {
              return Column(
                children: [
                  Text(
                    state.message!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Selected College: ${state.college!}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            } else {
              return const Text("No Found College Result");
            }
          },
        ),
      ),
    );
  }
}
