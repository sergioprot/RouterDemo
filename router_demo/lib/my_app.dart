import 'package:flutter/material.dart';
import 'package:router_demo/screens/log_in_screen.dart';

/// auto_route package example
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Router Demo',
      home: LogInScreen(),
    );
  }
}
