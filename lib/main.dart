import 'package:college_management_app/src/app/routes/app_routes.dart';
import 'package:college_management_app/src/localization/generated/l10n.dart';
import 'package:college_management_app/src/package/utils/theme.dart';
import 'package:college_management_app/src/ui/auth/login/login_page_view.dart';
import 'package:college_management_app/src/animation/demo.dart';
import 'package:flutter/material.dart';
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
        initialRoute: LoginPageView.routeName,
      ),
    );
  }
}
