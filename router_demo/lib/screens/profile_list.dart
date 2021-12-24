import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

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
            Beamer.of(context).beamToNamed('/members/user_1');
          },
        ),
        InkWell(
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('user_2'),
          ),
          onTap: () {
            Beamer.of(context).beamToNamed('/members/user_2');
          },
        ),
      ],
    );
  }
}
