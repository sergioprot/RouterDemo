import 'package:flutter/material.dart';
import 'package:router_demo/screens/log_in_screen.dart';
import 'package:router_demo/screens/members_area_new.dart';
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
          widgetBuilder: (child) => MembersAreaNew(child: child),
          nestedRoutes: [
            VWidget(
              path: 'index',
              widget: const ProfileList(),
              /*stackedRoutes: [
                VWidget(path: '/members/:username', widget: const Profile(), name: 'other-profile'),
              ],*/
            ),
            VWidget(path: 'mail/inbox', widget: const Text('Inbox')),
            VWidget(path: 'mail/sent', widget: const Text('Sent')),
            VWidget(path: 'mail/all', widget: const Text('All')),
            VGuard(
              beforeEnter: (vRedirector) async {
                print(vRedirector.toUrl);
              },
              stackedRoutes: [
                // VWidget(path: '/members/:username', widget: const Profile(), name: 'my-profile'),
                VWidget(path: 'my-profile/:username', widget: const Profile(), name: 'my-profile'),
              ],
            ),
            // VWidget(path: '/members/:username', widget: const Profile(), name: 'my-profile'),
          ],
          stackedRoutes: [
            /*VWidget.builder(
              path: 'members',
              aliases: ['members/:username'],
              name: 'other-profile',
              builder: (BuildContext context, VRouterData state) {
                return const Profile();
              },
            ),*/
            VWidget(
              path: 'members',
              aliases: const ['members/:username'],
              widget: const Profile(),
              name: 'other-profile',
            ),
          ],
        ),
        VPopHandler(
          stackedRoutes: [
            VWidget(path: '/members/:username', widget: const Profile()),
          ],
          onPop: (vRedirector) async => vRedirector.historyBack(),
        ),
      ],
    );
  }
}
