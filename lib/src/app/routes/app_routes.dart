import 'package:flutter/material.dart';

import '../../ui/auth/register_page_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get myRoutes => <String, WidgetBuilder>{
        RegisterPageView.routeName: RegisterPageView.builder,
      };
}
