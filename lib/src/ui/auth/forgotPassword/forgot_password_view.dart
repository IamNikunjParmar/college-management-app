import 'package:college_management_app/src/components/custom_text.dart';
import 'package:college_management_app/src/components/input_filed.dart';
import 'package:college_management_app/src/package/helper/validator.dart';
import 'package:college_management_app/src/package/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../localization/generated/l10n.dart';
import '../../../logic/auth/forgotPassword/forgot_password_cubit.dart';

class ForgotPasswordView extends StatelessWidget {
  static const String routeName = "forgot_password_view";

  ForgotPasswordView({super.key});

  final TextEditingController emailController = TextEditingController();

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(
        const ForgotPasswordState(),
        context: context,
      ),
      child: ForgotPasswordView(),
    );
  }

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = CMLocalizations.of(context);
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Forgot Password"),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Form(
                key: globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(20),
                    Align(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          ImagePath.forgotPassword,
                        ),
                      ),
                    ),
                    const Gap(10),
                    const CustomText(
                      title:
                          "Provide Your email and we will send you a link to \n                          Reset password",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    const Gap(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: l10n.emailAddress,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          colorName: Colors.blue,
                        ),
                        const Gap(10),
                        EmailTextField(
                          controller: emailController,
                          validator: validateEmailAddress,
                        ),
                        const Gap(30),
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  context
                                      .read<ForgotPasswordCubit>()
                                      .forgotPassword(emailController.text, emailController.text);
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
                                      "Send OTP",
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
