import 'package:college_management_app/src/ui/auth/admission%20Fee%20Payment/admission_payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../logic/auth/college Result/college_result_cubit.dart';

class CollegeResultView extends StatelessWidget {
  static const String routeName = "college_result_view";
  const CollegeResultView({super.key});

  static Widget builder(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final selectionId = args['_id'];

    return BlocProvider(
      create: (context) => CollegeResultCubit(
        const CollegeResultState(),
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
              return Align(
                child: Column(
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
                      ' ${state.college!}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    if (state.college != null) // Show button if college is matched
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AdmissionPaymentView.routeName,
                            arguments: state.selectionId,
                          );
                        },
                        child: const Text('Proceed to Payment'),
                      ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("No Found College Result"));
            }
          },
        ),
      ),
    );
  }
}
