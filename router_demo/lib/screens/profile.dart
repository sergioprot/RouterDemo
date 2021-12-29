import 'package:flutter/material.dart';
import 'package:router_demo/logged_user.dart';
import 'package:vrouter/vrouter.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = context.vRouter.pathParameters['username'] ?? loggedUser.username;

    if (username == loggedUser.username) {
      return ProfileBody(username: username);
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: ProfileBody(username: username),
      );
    }
  }
}

class ProfileBody extends StatelessWidget {
  final String username;

  const ProfileBody({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(username),
        if (username == loggedUser.username) const Text('This is your profile!'),
      ],
    );
  }
}
