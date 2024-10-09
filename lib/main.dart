import 'package:college_management_app/demo_home.dart';
import 'package:college_management_app/src/app/routes/app_routes.dart';
import 'package:college_management_app/src/localization/generated/l10n.dart';
import 'package:college_management_app/src/logic/auth/register/register_page_cubit.dart';
import 'package:college_management_app/src/package/utils/theme.dart';
import 'package:college_management_app/src/ui/auth/register/register_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [CMLocalizations.delegate],
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: AppRoutes.myRoutes,
      initialRoute: RegisterPageView.routeName,
    );
  }
}
