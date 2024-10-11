import 'package:college_management_app/demo_home.dart';
import 'package:college_management_app/src/ui/auth/forgotPassword/forgot_password_view.dart';
import 'package:college_management_app/src/ui/auth/login/login_page_view.dart';
import 'package:college_management_app/src/ui/auth/registration%20fee%20payment/registration_fee_payment.dart';
import 'package:college_management_app/src/ui/auth/reset%20password%20With%20Otp/reset_password_view.dart';
import 'package:college_management_app/src/ui/auth/uploadDocument/upload_document_view.dart';
import 'package:college_management_app/src/ui/auth/verifyOtp/registration_verification.dart';
import 'package:flutter/material.dart';

import '../../ui/auth/register/register_page_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get myRoutes => <String, WidgetBuilder>{
        RegisterPageView.routeName: RegisterPageView.builder,
        DemoHome.routeName: DemoHome.builder,
        RegistrationVerification.routeName: RegistrationVerification.builder,
        LoginPageView.routeName: LoginPageView.builder,
        ForgotPasswordView.routeName: ForgotPasswordView.builder,
        ResetPasswordView.routeName: ResetPasswordView.builder,
        UploadDocumentView.routeName: UploadDocumentView.builder,
        RegistrationFeePayment.routeName: RegistrationFeePayment.builder,
      };
}
