import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_application/feature/user/presentation/user_route_registrar.dart';
import 'package:mobile_application/presentation/home/home_screen.dart';

class PresentationRouteRegistrar {
  static StatefulShellRoute get homeRoute => StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/shop',
              name: 'shop-page',
              builder: (context, state) {
                return Container();
              },
            ),
          ]),
          StatefulShellBranch(
            routes: [
              UserRouteRegistrar.userRoute,
            ],
          )
        ],
      );
}
