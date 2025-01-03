import 'package:go_router/go_router.dart';
import 'package:mobile_application/presentation/user/user_route_registrar.dart';
import 'package:mobile_application/presentation/_presentation.dart';
import 'package:mobile_application/presentation/splash_screen/splash_screen.dart';

class PresentationRouteRegistrar {
  static StatefulShellRoute get homeRoute => StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/shop',
              name: 'shop-screen',
              builder: (context, state) {
                return const ShoppingScreen();
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

  static RouteBase get splashRoute => GoRoute(
        path: '/splash',
        name: 'splash-screen',
        builder: (context, state) => const SplashScreen(),
      );
}
