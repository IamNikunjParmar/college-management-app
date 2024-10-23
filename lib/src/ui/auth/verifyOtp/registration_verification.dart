import 'package:college_management_app/src/components/input_filed.dart';
import 'package:college_management_app/src/logic/auth/verifyOtp/registration_verification_cubit.dart';
import 'package:college_management_app/src/package/helper/validator.dart';
import 'package:college_management_app/src/package/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class RegistrationVerification extends StatelessWidget {
  static const String routeName = "Registration_Verification";
  RegistrationVerification({super.key});

  final TextEditingController otpController = TextEditingController();

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationVerificationCubit(
        const RegistrationVerificationState(),
        context: context,
      ),
      child: RegistrationVerification(),
    );
  }

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? userEmail = ModalRoute.of(context)!.settings.arguments as String?;

    return BlocBuilder<RegistrationVerificationCubit, RegistrationVerificationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Email Verification"),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            ImagePath.emailVerify,
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Check Your Email",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "We went to Verification link to",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      userEmail ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Pinput(
                      validator: validateOtp,
                      controller: otpController,
                      length: 6,
                      defaultPinTheme: PinTheme(
                        width: 50,
                        height: 50,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            context
                                .read<RegistrationVerificationCubit>()
                                .verifyOtp(userEmail ?? '', otpController.text);
                          }
                        },
                        child: state.verifyOtp ? const Text("OTP Verified") : const Text('Verify OTP'),
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextButton.icon(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                      label: const Text('Back To Register'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
