import 'package:go_router/go_router.dart';

class AppRouting {
  static GoRouter gorouter(List<RouteBase> routes) => GoRouter(
        initialLocation: '/login',

        // redirect: (context, state) {
        //   if (fa) {
        //     return '/login';
        //   }
        // },
        routes: routes,
      );
}
