import 'package:college_management_app/demo_home.dart';
import 'package:college_management_app/src/ui/auth/login/login_page_view.dart';
import 'package:college_management_app/src/ui/auth/verifyOtp/registration_verification.dart';
import 'package:flutter/material.dart';

import '../../ui/auth/register/register_page_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get myRoutes => <String, WidgetBuilder>{
        RegisterPageView.routeName: RegisterPageView.builder,
        DemoHome.routeName: DemoHome.builder,
        RegistrationVerification.routeName: RegistrationVerification.builder,
        LoginPageView.routeName: LoginPageView.builder,
      };
}
