import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:router_demo/screens/log_in_screen.dart';
import 'package:router_demo/screens/members_area.dart';
import 'package:router_demo/screens/profile.dart';

/// Beamer demo
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const LogInScreen(),
        '/home': (context, state, data) => const MembersArea(),
        '/members/:username': (context, state, data) {
          return Profile(username: state.pathParameters['username']!);
        },
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Router Demo',
      routerDelegate: _routerDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}
