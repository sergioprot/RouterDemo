import 'package:flutter/material.dart';
import 'package:router_demo/screens/profile.dart';
import 'package:router_demo/screens/profile_list.dart';

@Deprecated('Use MembersAreaNew')
class MembersArea extends StatefulWidget {
  const MembersArea({Key? key}) : super(key: key);

  @override
  _MembersAreaState createState() => _MembersAreaState();
}

@Deprecated('')
class _MembersAreaState extends State<MembersArea> {
  int bottomTab = 0;

  setBottomTab(int index) {
    setState(() {
      bottomTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Members Area'),
          bottom: bottomTab == 1
              ? const TabBar(
                  tabs: [
                    Tab(child: Text('Inbox')),
                    Tab(child: Text('Sent')),
                    Tab(child: Text('All')),
                  ],
                )
              : null,
        ),
        body: bottomTab == 0
            ? const ProfileList()
            : bottomTab == 1
                ? const TabBarView(children: [
                    Text('Inbox'),
                    Text('Sent'),
                    Text('All'),
                  ])
                : const Profile(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new),
              label: 'Matches',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Profile',
            ),
          ],
          onTap: (index) => setBottomTab(index),
        ),
      ),
    );
  }
}
