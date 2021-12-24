import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:router_demo/logged_user.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Column(
        children: [
          TextField(
            controller: inputController,
            onChanged: (_) => setState(() {}),
          ),
          ElevatedButton(
            onPressed: inputController.text.isEmpty
                ? null
                : () {
                    loggedUser.username = inputController.text;
                    // AutoRouter.of(context).navigateNamed('/home');
                    AutoRouter.of(context).pushNamed('/home');
                  },
            child: const Text('Log In'),
          ),
        ],
      ),
    );
  }
}
