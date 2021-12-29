import 'package:flutter/material.dart';
import 'package:router_demo/logged_user.dart';
import 'package:vrouter/vrouter.dart';

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
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const MembersArea()));
                    context.vRouter.to('/index');
                  },
            child: const Text('Log In'),
          ),
        ],
      ),
    );
  }
}
