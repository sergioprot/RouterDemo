import 'package:flutter/material.dart';
import 'package:router_demo/screens/profile.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('user_1'),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile(username: 'user_1')));
          },
        ),
        InkWell(
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('user_2'),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile(username: 'user_2')));
          },
        ),
      ],
    );
  }
}
