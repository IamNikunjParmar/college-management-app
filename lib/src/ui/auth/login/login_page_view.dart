import 'package:college_management_app/src/interceptor/input_filed.dart';
import 'package:college_management_app/src/ui/auth/forgotPassword/forgot_password_view.dart';
import 'package:college_management_app/src/ui/auth/register/register_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../components/custom_text.dart';
import '../../../localization/generated/l10n.dart';
import '../../../logic/auth/login/login_page_cubit.dart';
import '../../../package/helper/validator.dart';

class LoginPageView extends StatelessWidget {
  static const String routeName = "login_Page_view";
  LoginPageView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageCubit(
        const LoginPageState(),
        context: context,
      ),
      child: LoginPageView(),
    );
  }

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = CMLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    l10n.userLogin,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const Gap(15),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: l10n.emailAddress,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          colorName: Colors.blue,
                        ),
                        const Gap(5),
                        EmailTextField(
                          hintText: l10n.enterYourEmail,
                          controller: emailController,
                          validator: validateEmailAddress,
                        ),
                        const Gap(10),
                        CustomText(
                          title: l10n.password,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          colorName: Colors.blue,
                        ),
                        const Gap(5),
                        PasswordTextField(
                          controller: passwordController,
                          //  validator: validatePassword,
                          hintText: l10n.enterYourPassword,
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  RegisterPageView.routeName,
                                  (route) => true,
                                );
                              },
                              child: Text(l10n.registerUser),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, ForgotPasswordView.routeName);
                              },
                              child: Text(l10n.forgotPassword),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          context.read<LoginPageCubit>().loginUser(emailController.text, passwordController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: Text(
                        l10n.loginNow,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
