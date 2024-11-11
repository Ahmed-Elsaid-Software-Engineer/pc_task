import 'package:flutter/material.dart';
import 'package:pc_task/core/resources/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RoutesManager.routesList,
      initialRoute: RoutesName.usersRouteName,
      debugShowCheckedModeBanner: false,
    );
  }
}
