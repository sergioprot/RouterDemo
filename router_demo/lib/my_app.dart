import 'package:flutter/material.dart';
import 'package:router_demo/screens/log_in_screen.dart';
import 'package:router_demo/screens/members_area.dart';
import 'package:router_demo/screens/profile.dart';
import 'package:router_demo/screens/profile_list.dart';
import 'package:vrouter/vrouter.dart';

/// VRouter demo
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      initialUrl: '/login',
      routes: [
        VWidget(path: '/login', widget: const LogInScreen()),
        VNester(
          path: '/',
          widgetBuilder: (child) => MembersArea(child: child),
          nestedRoutes: [
            VWidget(
              path: 'index',
              widget: const ProfileList(),
              stackedRoutes: [
                VWidget(path: '/members/:username', widget: const Profile(), name: 'other-profile'),
              ],
            ),
            VWidget(path: 'mail/inbox', widget: const Text('Inbox')),
            VWidget(path: 'mail/sent', widget: const Text('Sent')),
            VWidget(path: 'mail/all', widget: const Text('All')),
            VGuard(
              beforeEnter: (vRedirector) async {
                // VGuard demo
                // ignore: avoid_print
                print(vRedirector.toUrl);
              },
              stackedRoutes: [
                VWidget(path: 'members/:username', widget: const Profile(), name: 'my-profile'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
