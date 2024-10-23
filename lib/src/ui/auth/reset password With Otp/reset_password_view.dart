import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../../components/custom_text.dart';
import '../../../components/input_filed.dart';
import '../../../localization/generated/l10n.dart';
import '../../../logic/auth/forgotPassword/forgot_password_cubit.dart';
import '../../../logic/auth/reset password with Otp/reset_password_cubit.dart';
import '../../../package/helper/validator.dart';
import '../../../package/utils/images_utils.dart';

class ResetPasswordView extends StatelessWidget {
  static const String routeName = "reset_password_view";
  ResetPasswordView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(
        const ResetPasswordState(),
        context: context,
      ),
      child: ResetPasswordView(),
    );
  }

  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final l10n = CMLocalizations.of(context);
    String? userEmail = ModalRoute.of(context)!.settings.arguments as String?;
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Reset Password"),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: globalKey,
                child: Column(
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
                    const Gap(10),
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
                    const Gap(10),
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
                    const Gap(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "Create New Password",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Gap(20),
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
                          focusNode: FocusNode(),
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
                        const Gap(30),
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  Log.error("OTP: ${otpController.text}");
                                  Log.error("passWord: ${passwordController.text}");
                                  context.read<ResetPasswordCubit>().resetPassword(
                                        userEmail.toString(),
                                        otpController.text,
                                        passwordController.text,
                                        confirmPasswordController.text,
                                      );
                                }
                              },
                              style: state.isLoading
                                  ? ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                      textStyle: const TextStyle(fontSize: 18),
                                    )
                                  : ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                      textStyle: const TextStyle(fontSize: 18),
                                    ),
                              child: state.isLoading
                                  ? const Text(
                                      "Continue",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      "Reset Password",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
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
