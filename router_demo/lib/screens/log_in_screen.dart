import 'package:beamer/beamer.dart';
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
                    Beamer.of(context).beamToNamed('/home');
                  },
            child: const Text('Log In'),
          ),
        ],
      ),
    );
  }
}
