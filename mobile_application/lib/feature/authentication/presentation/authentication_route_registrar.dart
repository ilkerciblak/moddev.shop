import 'package:go_router/go_router.dart';
import 'package:mobile_application/feature/authentication/presentation/_presentation.dart';

class AuthenticationRouteRegistrar {
  static RouteBase get loginRoute => GoRoute(
        path: '/login',
        name: 'login-screen',
        builder: (context, state) => const LoginScreen(),
      );
}
