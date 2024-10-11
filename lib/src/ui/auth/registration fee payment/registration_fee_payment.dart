import 'package:college_management_app/src/components/custom_text.dart';
import 'package:college_management_app/src/interceptor/input_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../logic/auth/registration fee payment/registration_fee_payment_cubit.dart';

class RegistrationFeePayment extends StatelessWidget {
  static const String routeName = "registration_fee_payment";
  RegistrationFeePayment({super.key});

  final emailController = TextEditingController();
  final amountController = TextEditingController();
  final userIdController = TextEditingController();

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationFeePaymentCubit(
        RegistrationFeePaymentState(),
        context: context,
      ),
      child: RegistrationFeePayment(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String? userId = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CustomText(
                  title: 'UserId',
                  fontSize: 16,
                  colorName: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                const Gap(10),
                CustomTextField(
                  controller: userIdController,
                  hintText: userId ?? '',
                  isReadOnly: true,
                ),
                const Gap(10),
                const CustomText(
                  title: 'Email',
                  fontSize: 16,
                  colorName: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                const Gap(10),
                EmailTextField(
                  hintText: 'Enter your Email',
                  controller: emailController,
                ),
                const Gap(10),
                const CustomText(
                  title: 'Amount',
                  fontSize: 16,
                  colorName: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                const Gap(10),
                CustomTextField(
                  controller: amountController,
                  hintText: 'Enter your amount',
                ),
                const Gap(30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Process the payment
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Processing Payment'),
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        context
                            .read<RegistrationFeePaymentCubit>()
                            .feesPayment(userId!, emailController.text, amountController.text);
                      }
                    },
                    child: const Text('Pay'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
