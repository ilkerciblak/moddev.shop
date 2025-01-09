import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/presentation/shopping_screen/shopping_screen_registrar.dart';
import 'package:mobile_application/presentation/user/user_route_registrar.dart';
import 'package:mobile_application/presentation/_presentation.dart';
import 'package:mobile_application/presentation/splash_screen/splash_screen.dart';

class PresentationRouteRegistrar {
  static StatefulShellRoute get homeRoute => StatefulShellRoute(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              ShoppingScreenRegistrar.shoppingRoute,
            ],
          ),
          StatefulShellBranch(routes: [
            CartScreenRouteRegistrar.cartScreen,
          ]),
          StatefulShellBranch(
            routes: [
              UserRouteRegistrar.userRoute,
            ],
          )
        ],
        navigatorContainerBuilder: (context, navigationShell, children) {
          final List<Widget> stackWidgets = children.mapWithIndex(
            (t, index) {
              if (index == 0) {
                return Visibility.maintain(
                  visible: navigationShell.currentIndex == 0,
                  child: TickerMode(
                    enabled: navigationShell.currentIndex == 0,
                    child: t,
                  ),
                );
              }
              return Visibility(
                maintainState: false,
                visible: navigationShell.currentIndex == index,
                child: TickerMode(
                  enabled: navigationShell.currentIndex == index,
                  child: t,
                ),
              );
            },
          ).toList();
          return IndexedStack(
            index: navigationShell.currentIndex,
            children: stackWidgets,
          );
        },
      );

  static RouteBase get splashRoute => GoRoute(
        path: '/splash',
        name: 'splash-screen',
        builder: (context, state) => const SplashScreen(),
      );
}
