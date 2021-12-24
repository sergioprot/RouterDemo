import 'package:auto_route/auto_route.dart';
import 'package:router_demo/screens/log_in_screen.dart';
import 'package:router_demo/screens/members_area.dart';
import 'package:router_demo/screens/profile.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: LogInScreen, initial: true),
    AutoRoute(page: MembersArea, path: '/home'),
    AutoRoute(page: Profile, path: 'members/:username'),
  ],
)
class $AppRouter {}
