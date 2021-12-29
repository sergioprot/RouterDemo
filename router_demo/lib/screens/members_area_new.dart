import 'package:flutter/material.dart';
import 'package:router_demo/logged_user.dart';
import 'package:vrouter/vrouter.dart';

class MembersAreaNew extends StatelessWidget {
  final Widget child;

  const MembersAreaNew({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: context.vRouter.url.contains('/mail/sent')
          ? 1
          : context.vRouter.url.contains('/mail/all')
              ? 2
              : 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Members Area'),
          bottom: context.vRouter.url.contains('/mail')
              ? TabBar(
                  onTap: (tab) {
                    if (tab == 0) {
                      context.vRouter.to('/mail/inbox');
                    } else if (tab == 1) {
                      context.vRouter.to('/mail/sent');
                    } else if (tab == 2) {
                      context.vRouter.to('/mail/all');
                    }
                  },
                  tabs: const [
                    Tab(child: Text('Inbox')),
                    Tab(child: Text('Sent')),
                    Tab(child: Text('All')),
                  ],
                )
              : null,
        ),
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: context.vRouter.url.contains('/index')
              ? 0
              : context.vRouter.url.contains('/mail')
                  ? 1
                  : 2,
          onTap: (tab) => (tab == 0)
              ? context.vRouter.to('/index')
              : (tab == 1)
                  ? context.vRouter.to('/mail/inbox')
                  : context.vRouter.toNamed('my-profile', pathParameters: {'username': loggedUser.username}),
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
        ),
      ),
    );
  }
}
