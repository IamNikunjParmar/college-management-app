import 'package:college_management_app/demo_home.dart';
import 'package:flutter/material.dart';

import '../../ui/auth/register_page_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get myRoutes => <String, WidgetBuilder>{
        RegisterPageView.routeName: RegisterPageView.builder,
        DemoHome.routeName: DemoHome.builder,
      };
}
