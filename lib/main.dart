import 'package:college_management_app/src/app/routes/app_routes.dart';
import 'package:college_management_app/src/localization/generated/l10n.dart';
import 'package:college_management_app/src/logic/auth/register/register_page_cubit.dart';
import 'package:college_management_app/src/package/utils/theme.dart';
import 'package:college_management_app/src/ui/auth/forgotPassword/forgot_password_view.dart';
import 'package:college_management_app/src/ui/auth/home/home_page_view.dart';
import 'package:college_management_app/src/ui/auth/login/login_page_view.dart';
import 'package:college_management_app/src/ui/auth/register/register_page_view.dart';
import 'package:college_management_app/src/ui/auth/registration%20fee%20payment/registration_fee_payment.dart';
import 'package:college_management_app/src/ui/auth/reset%20password%20With%20Otp/reset_password_view.dart';
import 'package:college_management_app/src/ui/auth/uploadDocument/upload_document_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        localizationsDelegates: const [CMLocalizations.delegate],
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routes: AppRoutes.myRoutes,
        initialRoute: HomePageView.routeName,
      ),
    );
  }
}
