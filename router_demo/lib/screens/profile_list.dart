import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

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
            // context.vRouter.to('/members/user_1');
            context.vRouter.toNamed('other-profile', pathParameters: {'username': 'user_1'});
          },
        ),
        InkWell(
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('user_2'),
          ),
          onTap: () {
            // context.vRouter.to('/members/user_1');
            context.vRouter.toNamed('other-profile', pathParameters: {'username': 'user_1'});
          },
        ),
      ],
    );
  }
}
