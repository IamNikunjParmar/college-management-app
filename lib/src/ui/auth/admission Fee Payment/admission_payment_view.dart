import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../logic/auth/admission Payment/admission_payment_cubit.dart';

class AdmissionPaymentView extends StatelessWidget {
  static const String routeName = "admission_payment_view";

  const AdmissionPaymentView({super.key});

  static Widget builder(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    final selectionId = args;
    return BlocProvider(
      create: (context) => AdmissionPaymentCubit(
        AdmissionPaymentState(selectionId: selectionId),
        context: context,
      ),
      child: const AdmissionPaymentView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdmissionPaymentCubit, AdmissionPaymentState>(
      builder: (context, state) {
        Log.debug(state.selectionId);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Admission Fees Payment"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Admission Fee",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  const Text(
                    "₹10,000",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const Gap(32),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AdmissionPaymentCubit>().admissionFeePayment(state.selectionId!, 10000);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text("Pay Now"),
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
