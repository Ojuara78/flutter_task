import 'package:flutter/material.dart';
import 'package:tasks_bloc/screen/recyle_bin_screen.dart';
import 'package:tasks_bloc/screen/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBinScreen.id:
        return MaterialPageRoute(builder: (context) => const RecycleBinScreen());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (context) => const TabsScreen());
      default:
        return null;
    }
  }
}
