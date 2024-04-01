import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../login/page/login_page.dart';
import '../../weather_list/page/weather_list_page.dart';
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(
        name: Routes.weatherList,
        path: '/weatherList',
        builder: (context, state) {
          String? name = state.uri.queryParameters['name'];
          return WeatherListPage(name: name);
        }),
    GoRoute(
      name: Routes.login,
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
