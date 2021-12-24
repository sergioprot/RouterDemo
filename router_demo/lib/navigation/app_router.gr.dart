// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../screens/log_in_screen.dart' as _i1;
import '../screens/members_area.dart' as _i2;
import '../screens/profile.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LogInScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LogInScreen());
    },
    MembersAreaRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MembersArea());
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.Profile(key: args.key, username: args.username));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(LogInScreenRoute.name, path: '/'),
        _i4.RouteConfig(MembersAreaRoute.name, path: '/home'),
        _i4.RouteConfig(ProfileRoute.name, path: 'members/:username')
      ];
}

/// generated route for
/// [_i1.LogInScreen]
class LogInScreenRoute extends _i4.PageRouteInfo<void> {
  const LogInScreenRoute() : super(LogInScreenRoute.name, path: '/');

  static const String name = 'LogInScreenRoute';
}

/// generated route for
/// [_i2.MembersArea]
class MembersAreaRoute extends _i4.PageRouteInfo<void> {
  const MembersAreaRoute() : super(MembersAreaRoute.name, path: '/home');

  static const String name = 'MembersAreaRoute';
}

/// generated route for
/// [_i3.Profile]
class ProfileRoute extends _i4.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({_i5.Key? key, required String username})
      : super(ProfileRoute.name,
            path: 'members/:username',
            args: ProfileRouteArgs(key: key, username: username));

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key, required this.username});

  final _i5.Key? key;

  final String username;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, username: $username}';
  }
}
