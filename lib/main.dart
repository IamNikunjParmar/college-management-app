import 'package:college_management_app/demo_home.dart';
import 'package:college_management_app/src/app/routes/app_routes.dart';
import 'package:college_management_app/src/ui/auth/register_page_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: AppRoutes.myRoutes,
      initialRoute: RegisterPageView.routeName,
    );
  }
}
