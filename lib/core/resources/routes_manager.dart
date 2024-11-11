import 'package:flutter/material.dart';
import 'package:pc_task/view/user_datails/screen/user_details_screen.dart';
import 'package:pc_task/view/users/screens/users_screen.dart';

class RoutesName {
  static const String usersRouteName = 'users_route_name';
  static const String usersDetailsRouteName = 'users_details_route_name';
}

class RoutesManager {
  static Map<String, WidgetBuilder> routesList = {
    RoutesName.usersRouteName: (context) => const UsersScreen(),
    RoutesName.usersDetailsRouteName: (context) => const UserDetailsScreen()
  };
}
