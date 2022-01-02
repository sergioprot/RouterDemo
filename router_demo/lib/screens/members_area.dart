import 'package:flutter/material.dart';
import 'package:router_demo/logged_user.dart';
import 'package:vrouter/vrouter.dart';

/// Members Area
///
/// Contains:
/// 1. Profile List page
/// 2. Mail page
/// 3. My Profile page
class MembersArea extends StatelessWidget {
  final Widget child;

  const MembersArea({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Only show bottom navigation bar on listed pages
    if (!(context.vRouter.url.contains('/index') ||
        context.vRouter.url.contains('/mail') ||
        context.vRouter.url.contains('/members/' + loggedUser.username))) {
      return Container(
        child: child,
      );
    }
    return DefaultTabController(
      /// Set initial upper tab according to url
      initialIndex: context.vRouter.url.contains('/mail/sent')
          ? 1
          : context.vRouter.url.contains('/mail/all')
              ? 2
              : 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Members Area'),

          /// Upper tab bar
          bottom: context.vRouter.url.contains('/mail')
              ? TabBar(
                  onTap: (tab) {
                    /// Upper tab bar navigation
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
          /// Set initial bottom tab according to url
          currentIndex: context.vRouter.url.contains('/index')
              ? 0
              : context.vRouter.url.contains('/mail')
                  ? 1
                  : 2,

          /// Bottom tab bar navigation
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
